Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OeRKM-0006oq-3r
	for linux-mtd@lists.infradead.org; Thu, 29 Jul 2010 11:31:08 +0000
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
	by mailout3.samsung.com
	(Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12
	2010)) with ESMTP id <0L6B004PKHBQZTD0@mailout3.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 29 Jul 2010 20:31:02 +0900 (KST)
Received: from roh83 ([107.108.214.183])
	by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTPA id <0L6B00802HBNYF@mmp1.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 29 Jul 2010 20:31:02 +0900 (KST)
Date: Thu, 29 Jul 2010 17:00:59 +0530
From: Rohit Hassan Sathyanarayan <rohit.hs@samsung.com>
Subject: [PATCH 1/1][MTD-UTILS] Adding run-time mtd partitioning utility
To: linux-mtd@lists.infradead.org
Message-id: <000001cb2f11$85fb9cc0$91f2d640$%hs@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-language: en-us
Content-transfer-encoding: 7BIT
Cc: Vivek Dalal <vivek.dalal@siso.com>, 'David Woodhouse' <dwmw2@infradead.org>,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All

Sending the patch on mtd-utils for run-time partitioning utility.



Signed-off-by: Rohit HS <rohit.hs@samsung.com>
---
Makefile                |    1
include/mtd/mtd-abi.h   |   16 +
mtd_runtime_partition.c |  389 ++++++++++++++++++++++++++++++++++++++++++++++++
3 files changed, 406 insertions(+)

diff --git a/Makefile b/Makefile
index d315f39..bfa2c45 100644
--- a/Makefile
+++ b/Makefile
@@ -16,6 +16,7 @@ TARGETS = ftl_format flash_erase flash_eraseall nanddump doc_loadbios \
 	nftldump nftl_format docfdisk \
 	rfddump rfdformat \
 	serve_image recv_image \
+	mtd_runtime_partition \
 	sumtool #jffs2reader
 
 SYMLINKS =
diff --git a/include/mtd/mtd-abi.h b/include/mtd/mtd-abi.h
index c6954ed..22ba713 100644
--- a/include/mtd/mtd-abi.h
+++ b/include/mtd/mtd-abi.h
@@ -30,6 +30,18 @@ struct mtd_oob_buf64 {
 	__u64 usr_ptr;
 };
 
+struct user_mtd {
+	char name[32];
+	 __u64 partition_size;
+	 __u64 partition_offset;
+	 __u32 partition_mask;
+};
+
+struct user_mtd_info {
+	struct user_mtd *pst_user_partitions;
+	__u32 num_partitions;
+};
+
 #define MTD_ABSENT		0
 #define MTD_RAM			1
 #define MTD_ROM			2
@@ -110,6 +122,10 @@ struct otp_info {
 #define MEMERASE64		_IOW('M', 20, struct erase_info_user64)
 #define MEMWRITEOOB64		_IOWR('M', 21, struct mtd_oob_buf64)
 #define MEMREADOOB64		_IOWR('M', 22, struct mtd_oob_buf64)
+#define MTDPARTITIONCREATE      _IOW('M', 23, int)
+#define MTDPARTITIONDELETE      _IOW('M', 24, int)
+#define MTDPARTITIONSETPERMISSION _IOW('M', 26, int)
+#define MTDPARTITIONMERGE       _IOW('M', 27, int)
 
 /*
  * Obsolete legacy interface. Keep it in order not to break userspace
diff --git a/mtd_runtime_partition.c b/mtd_runtime_partition.c
new file mode 100644
index 0000000..a639563
--- /dev/null
+++ b/mtd_runtime_partition.c
@@ -0,0 +1,389 @@
+/*======================================================================
+	mtd_runtime_partition.c: Run-Time Partitioning Support Utility
+	(C) Copyright 2009-2010
+	Samsung Electronics, <www.samsung.com>
+
+	This program is free software; you can redistribute it and/or modify
+	it under the terms of the GNU General Public License as published by
+	the Free Software Foundation; either version 2 of the License, or
+	(at your option) any later version.
+
+	This program is distributed in the hope that it will be useful,
+	but WITHOUT ANY WARRANTY; without even the implied warranty of
+	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+	GNU General Public License for more details.
+
+	You should have received a copy of the GNU General Public License
+	along with this program; if not, write to the Free Software
+
+	This is utility for run-time partitioning support in MTD
+	Usage:
+	#mtdpart-h
+	Options
+		c -- Create Partition
+		d -- Delete Partition
+		j -- Merge adjacent Partition
+		p -- Set Partition Permission
+			ro  -> ReadOnly Permission
+			wr -> WriteRead Permission
+
+======================================================================*/
+
+#include <unistd.h>
+#include <stdlib.h>
+#include <stdio.h>
+#include <fcntl.h>
+#include <time.h>
+#include <sys/ioctl.h>
+#include <sys/mount.h>
+#include <mtd/mtd-user.h>
+#include <errno.h>
+#include <string.h>
+#include <stdlib.h>
+
+#define MTD_NUMBER_DIGITS	(2)
+#define MTD_READWRITE		(0)
+#define MAX_ALLOWED		(4)
+
+#undef DEBUG
+#ifdef DEBUG
+#define dbg(x) printf x
+#else
+#define dbg(x)
+#endif
+
+#define PARTITION_INVALID		(0)
+#define PARTITION_SIZE_NOTALIGNED	(1)
+#define PARTITION_VALID			(2)
+
+struct user_mtd_info user_mtd_data;
+static const char s_entry_node[] = "/dev/mtd0";
+static const char s_mtd_to_partition[16];
+static uint64_t u64_mtd_erase_size;
+/*
+*  NAME        : get_mag
+*  DESCRIPTION : Converts string to hex.
+*  PARAMS:
+*  Input::    p8_buf :Char pointer to buffer.
+*  Return value:: Converted Hex number.
+*
+*/
+static uint64_t get_mag(char *p8_buf)
+{
+	int j = 0;
+	uint64_t temp = 0;
+	uint64_t data = 0;
+	int count = 0;
+
+	while (1) {
+		if (p8_buf[count] == 0xff)
+			break;
+		count++;
+	}
+	count -= 2;
+	while (count >= 0) {
+		if ((p8_buf[count] >= '0') && (p8_buf[count] <= '9')) {
+			temp = p8_buf[count] - '0';
+			data |= (temp << (j*4));
+		} else if ((p8_buf[count] >= 'a') && (p8_buf[count] <= 'f')) {
+			temp = (p8_buf[count] - 'a') + 10;
+			data |= (temp << (j*4));
+		}
+	j++;
+	count--;
+	}
+	return data;
+}
+
+/*
+*  NAME        : partition_help
+*  DESCRIPTION : This is help function for syntax.
+*  PARAMS:
+*  Input::    None.
+*  Return value: None.
+*
+*/
+static void partition_help(void)
+{
+	fprintf(stderr, "Options\n"
+		"=======================================================\n"
+		"\r c -- Create Partition\n"
+		"\r d -- Delete Partition\n"
+		"\r j -- Merge adjacent Partition\n"
+		"\r p -- Set Partition Permission\n"
+		"         ro  -> ReadOnly Permission\n"
+		"         wr -> WriteRead Permission\n"
+		"=======================================================\n");
+	exit(0);
+}
+/*
+ * NAME        : get_mtd_number
+ * DESCRIPTION : This Function gives mtd device number from mtd device node.
+ * PARAMS:
+ * Input:: p8_ptr: Char pointer to mtd device name.
+ * Return value: MTD Device Number.
+ *
+*/
+static int get_mtd_number(char *p8_ptr)
+{
+	char temp[2] = {0};
+	int i = 0;
+	int dummy = 0;
+
+	while (*p8_ptr++ != 0)
+		dummy = 0;
+	--p8_ptr;
+	for (i = MTD_NUMBER_DIGITS-1; i >= 0; i--) {
+		--p8_ptr;
+		if ((*p8_ptr >= '0') && (*p8_ptr <= '9'))
+			temp[i] = *p8_ptr;
+	}
+	if (temp[0] == 0) {
+		temp[0] = temp[MTD_NUMBER_DIGITS-1];
+		temp[MTD_NUMBER_DIGITS-1] = 0;
+	}
+	i = -1;
+	i = (int)atoi(temp);
+	return i;
+}
+/*
+*  NAME        : get_partition_data
+*  DESCRIPTION : This Function parses MTD user Partition and updates.
+*  PARAMS:
+*    Input::	None.
+*    Return value: None.
+*
+*/
+static void get_partition_data(void)
+{
+	char temp = 0;
+	int index = 0;
+	char partition_name[32];
+	char buffer[16];
+	struct user_mtd *ptr_pdata;
+	char mask_flags[2];
+
+	fprintf(stdout, "Enter number of Partitions to create\n");
+	fscanf(stdin, "%c", &temp);
+	user_mtd_data.num_partitions = (int)atoi(&temp);
+
+	if (user_mtd_data.num_partitions <= 0) {
+		fprintf(stderr, "Error in number of Partitions\n");
+		exit(0);
+	}
+	user_mtd_data.pst_user_partitions = malloc(sizeof(struct user_mtd)*
+						user_mtd_data.num_partitions);
+	ptr_pdata = user_mtd_data.pst_user_partitions;
+	if (user_mtd_data.pst_user_partitions == NULL) {
+		fprintf(stderr, "Unable to allocate memory\n");
+		exit(0);
+	}
+
+	for (index = 0; index < user_mtd_data.num_partitions; index++) {
+		/*Get MTD Partition name*/
+		fprintf(stdout, "Enter Partition %d data\n", index+1);
+		fprintf(stdout, "=======================\n");
+		fprintf(stdout, "Enter Partition name\n");
+		fscanf(stdin, "%s", partition_name);
+		memcpy(ptr_pdata->name, partition_name, 32);
+		/*Get MTD Partition offset*/
+		fprintf(stdout, "Enter Partition Offset\n");
+		memset(buffer, 0xff, 16);
+		fscanf(stdin, "%s", buffer);
+		ptr_pdata->partition_offset =  get_mag(buffer);
+		if ((ptr_pdata->partition_offset % u64_mtd_erase_size) != 0) {
+			fprintf(stderr, "Partition offset allignmenterror\n");
+			exit(0);
+		}
+		/*Get MTD Partition Size*/
+		fprintf(stdout, "Enter Partition Size\n");
+		memset(buffer, 0xff, 16);
+		fscanf(stdin, "%s", buffer);
+		ptr_pdata->partition_size =  get_mag(buffer);
+		if (ptr_pdata->partition_size < u64_mtd_erase_size) {
+			fprintf(stderr, "Partition size < block size\n");
+			exit(0);
+		}
+		if ((ptr_pdata->partition_size % u64_mtd_erase_size) != 0) {
+			fprintf(stderr, "Partition allignment error\n");
+			exit(0);
+		}
+		/*Get MTD Partition permission*/
+		fprintf(stdout, "EnterPartitionPermission:: ro or wr\n");
+		fscanf(stdin, "%s", mask_flags);
+		if (strcmp((const char *)mask_flags, (const char*)"wr") == 0)
+			ptr_pdata->partition_mask = MTD_READWRITE;
+		else if (strcmp((const char *)mask_flags,
+				(const char *)"ro") == 0)
+			ptr_pdata->partition_mask = MTD_WRITEABLE;
+		else {
+			fprintf(stderr, "Only ro and wr allowed\n");
+			exit(0);
+		}
+		/*Get nex MTD Partition information*/
+		ptr_pdata++;
+		fprintf(stdout, "=======================\n");
+	}
+}
+/*
+*  NAME        : main
+*  DESCRIPTION : This function is the entry point for the application
+*
+*	PARAMS:
+*	Input::
+*            argv[1] : ASCII character 'c' to create Partition
+*                                      'd' to delete Partition
+*                                      'p' to set permission
+*                                      'j' to merge Partition
+*            argv[2] : Pointer to MTD device name
+*            argv[3] : Pointer to Partition Information
+*
+*  Return value: Zero on Success
+*                Error on File open.
+*
+*/
+int main(int u8_argc, char *p8_argv[])
+{
+	int i32_Fd;
+	char u8_cmd;
+	uint32_t u32_mask_flags;
+	mtd_info_t mtd_memory;
+	unsigned char merge_partitions[2];
+	int delete_part_num = -1;
+
+	if (u8_argc == 1) {
+		partition_help();
+		return -1;
+	}
+	if ((p8_argv[1][0] != 'c')
+		&& (p8_argv[1][0] != 'd')
+		&& (p8_argv[1][0] != 'p')
+		&& (p8_argv[1][0] != 'j')) {
+		partition_help();
+		return -1;
+	}
+
+	u8_cmd = p8_argv[1][0];
+	switch (u8_cmd) {
+	case 'c':
+	case 'C':
+		if (u8_argc < 3) {
+			fprintf(stderr, "Create MTD Partitions usage..\n");
+			fprintf(stderr, "mtdpart c /dev/mtd4\n");
+			exit(0);
+		}
+		i32_Fd = open(p8_argv[2], O_RDONLY);
+		if (i32_Fd < 0) {
+			fprintf(stderr, "File open error\n");
+			return -1;
+		}
+		/*Get MTD Erase size*/
+		if (ioctl(i32_Fd, MEMGETINFO, &mtd_memory) != 0) {
+			dbg(("Error in reading MTD memory data\n"));
+			return -1;
+		}
+		u64_mtd_erase_size = mtd_memory.erasesize;
+		/*Get MTD partitions from user*/
+		get_partition_data();
+		/*Create MTD partitions*/
+		if (ioctl(i32_Fd, MTDPARTITIONCREATE, &user_mtd_data) == 0)
+			dbg((" mtd partitions created\n"));
+		close(i32_Fd);
+		/*Open default mtd device*/
+		i32_Fd = open(s_entry_node, O_RDONLY);
+		if (i32_Fd < 0) {
+			fprintf(stderr, "File open error\n");
+			return -1;
+		}
+		/*Delete parent MTD device*/
+		delete_part_num = get_mtd_number(p8_argv[2]);
+		if (ioctl(i32_Fd, MTDPARTITIONDELETE, &delete_part_num) == 0)
+			dbg(("mtd partition deleted\n"));
+		close(i32_Fd);
+		break;
+	case 'd':
+	case 'D':
+		/*sanity check*/
+		if (u8_argc < 3) {
+			fprintf(stderr, "Delete MTD Partition usage..\n");
+			fprintf(stderr, "mtdpart d /dev/mtd4\n");
+			exit(0);
+		}
+		i32_Fd = open(p8_argv[2], O_RDONLY);
+		if (i32_Fd < 0) {
+			fprintf(stderr, "File open error\n");
+			return -1;
+		}
+		close(i32_Fd);
+		/*Delete user given partition*/
+		i32_Fd = open(s_entry_node, O_RDONLY);
+		if (i32_Fd < 0) {
+			fprintf(stderr, "File open error\n");
+			return -1;
+		}
+		delete_part_num = get_mtd_number(p8_argv[2]);
+		if (ioctl(i32_Fd, MTDPARTITIONDELETE, &delete_part_num) == 0)
+			fprintf(stdout, " mtd partition deleted\n");
+		else
+			fprintf(stderr, "Unable to delete Partition\n");
+		close(i32_Fd);
+		break;
+	case 'p':
+	case 'P':
+		/*sanity check*/
+		if (u8_argc < 4) {
+			fprintf(stderr, "Change Partition permission usage\n");
+			fprintf(stderr, "mtdpart p /dev/mtd4 ro|wr\n");
+			exit(0);
+		}
+		u32_mask_flags = ((0x0000FFFF) & get_mtd_number(p8_argv[2]));
+		/* Get the Permisson from user */
+		if (strcmp((const char *)p8_argv[3], (const char *)"wr") == 0) {
+			u32_mask_flags |= ((MTD_WRITEABLE << 16)&(0xFFFF0000));
+		} else if (strcmp(p8_argv[3], "ro") == 0) {
+			u32_mask_flags |= ((MTD_READWRITE << 16)&(0xFFFF0000));
+		} else {
+		fprintf(stderr, "Wrong Permission Options\n");
+		break;
+		}
+		/* Open the MTD device and set the Permission*/
+		i32_Fd = open(s_entry_node, O_RDONLY);
+		if (i32_Fd < 0) {
+			fprintf(stderr, "File open error\n");
+			return -1;
+		}
+		/*Change Partition permission*/
+		if (ioctl(i32_Fd, MTDPARTITIONSETPERMISSION, &u32_mask_flags)
+				 == 0)
+			fprintf(stdout, "Permission changed successfully\n");
+		else
+			fprintf(stderr, "set Partition Priority error\n");
+		close(i32_Fd);
+		break;
+	case 'j':
+	case 'J':
+		if (u8_argc < 4) {
+			fprintf(stderr, "Merge adjacent Partiitons usage\n");
+			fprintf(stderr, "mtdpart j /dev/mtd4 /dev/mtd5\n");
+			exit(0);
+		}
+		merge_partitions[0] = get_mtd_number(p8_argv[2]);
+		merge_partitions[1] = get_mtd_number(p8_argv[3]);
+		/*Open the MTD device and merge Partition*/
+		i32_Fd = open(s_entry_node, O_RDONLY);
+		if (i32_Fd < 0) {
+			fprintf(stderr, "File open error\n");
+			return -1;
+		}
+		/*Merge two adjacent partitions*/
+		if (0 == ioctl(i32_Fd, MTDPARTITIONMERGE, &merge_partitions))
+			fprintf(stdout, "Partitions merged successfully\n");
+		else
+			fprintf(stderr, "Unable to merge Partition\n");
+		close(i32_Fd);
+		break;
+	}
+	return 0;
+}
+
+
---
