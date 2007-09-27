Received: from mtagate5.de.ibm.com ([195.212.29.154])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Iaxv4-0008Dx-Og
	for linux-mtd@lists.infradead.org; Thu, 27 Sep 2007 19:17:09 +0100
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate5.de.ibm.com (8.13.8/8.13.8) with ESMTP id l8RIGifH448736
	for <linux-mtd@lists.infradead.org>; Thu, 27 Sep 2007 18:16:44 GMT
Received: from d12av01.megacenter.de.ibm.com (d12av01.megacenter.de.ibm.com
	[9.149.165.212])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v8.5) with
	ESMTP id l8RIGikp2101324
	for <linux-mtd@lists.infradead.org>; Thu, 27 Sep 2007 20:16:44 +0200
Received: from d12av01.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av01.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l8RIGha6005021
	for <linux-mtd@lists.infradead.org>; Thu, 27 Sep 2007 20:16:44 +0200
From: Alexander Schmidt <alexs@linux.vnet.ibm.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/4 try2] ubi-utils: remove libubiold
References: <200709271952.06870.alexs@linux.vnet.ibm.com>
In-Reply-To: <200709271952.06870.alexs@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200709272016.12341.alexs@linux.vnet.ibm.com>
Cc: Andreas Arnez <arnez@linux.vnet.ibm.com>,
	Frank Haverkamp <haver@linux.vnet.ibm.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Thu, 27 Sep 2007 18:17:40 -0000

Remove the old libubi.

Signed-off-by: Alexander Schmidt <alexs@linux.vnet.ibm.com>
=2D--
 ubi-utils/inc/libubiold.h       |  310 ----------------
 ubi-utils/src/libubiold.c       |  768 -----------------------------------=
=2D----
 ubi-utils/src/libubiold_int.h   |  119 ------
 ubi-utils/src/libubiold_sysfs.c |  232 ------------
 ubi-utils/src/libubiold_sysfs.h |  109 -----
 5 files changed, 1538 deletions(-)

=2D-- mtd-utils.orig/ubi-utils/inc/libubiold.h
+++ /dev/null
@@ -1,310 +0,0 @@
=2D#ifndef __UBI_H__
=2D#define __UBI_H__
=2D/*
=2D * Copyright (c) International Business Machines Corp., 2006
=2D *
=2D * This program is free software; you can redistribute it and/or modify
=2D * it under the terms of the GNU General Public License as published by
=2D * the Free Software Foundation; either version 2 of the License, or
=2D * (at your option) any later version.
=2D *
=2D * This program is distributed in the hope that it will be useful,
=2D * but WITHOUT ANY WARRANTY; without even the implied warranty of
=2D * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
=2D * the GNU General Public License for more details.
=2D *
=2D * You should have received a copy of the GNU General Public License
=2D * along with this program; if not, write to the Free Software
=2D * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
=2D */
=2D
=2D/*
=2D * UBI (Unsorted Block Images) library.
=2D * @file	libubi.h
=2D * @author	Artem B. Bityutskiy
=2D * @author      Additions: Oliver Lohmann
=2D * @version	1.0
=2D */
=2D
=2D#include <stdint.h>
=2D#include <mtd/ubi-user.h>
=2D
=2D#ifdef __cplusplus
=2Dextern "C" {
=2D#endif
=2D
=2D/**
=2D * @section eh Error Handling
=2D * The following error indication policy is used: in case of success, all
=2D * library functions return 0, in case of failure they either return UBI=
 error
=2D * codes, or -1 if a system error occured; in the latter case the exact =
error
=2D * code has to be in the errno variable.
=2D *
=2D * @def UBI_ENOTFOUND
=2D *	@brief UBI was not found in the system.
=2D * @def UBI_EBUG
=2D *	@brief An error due to bug in kernel part of UBI in UBI library.
=2D * @def UBI_EINVAL
=2D *	@brief Invalid argument.
=2D * @def UBI_EMACS
=2D *	@brief Highest error value.
=2D */
=2D#define UBI_ENOTFOUND	1
=2D#define UBI_EBUG	2
=2D#define UBI_EINVAL	3
=2D#define UBI_EMAX	4
=2D
=2D
=2D/**
=2D * UBI library descriptor, vague for library users.
=2D */
=2Dtypedef struct ubi_lib *ubi_lib_t;
=2D
=2D/**
=2D * struct ubi_info - general information about UBI.
=2D *
=2D * @version    UBI version
=2D * @nlen_max   maximum length of names of volumes
=2D * @dev_count  count UBI devices in the system
=2D */
=2Dstruct ubi_info
=2D{
=2D	unsigned int version;
=2D	unsigned int nlen_max;
=2D	unsigned int dev_count;
=2D};
=2D
=2D/**
=2D * struct ubi_dev_info - information about an UBI device
=2D *
=2D * @wear       average number of erasures of flash erasable blocks
=2D * @major      major number of the corresponding character device
=2D * @minor      minor number of the corresponding character device
=2D * @eb_size    size of eraseblocks
=2D * @total_ebs  total count of eraseblocks
=2D * @avail_ebs  count of unused eraseblock available for new volumes
=2D * @vol_count  total count of volumes in this UBI device
=2D */
=2Dstruct ubi_dev_info
=2D{
=2D	unsigned long long wear;
=2D	unsigned int major;
=2D	unsigned int minor;
=2D	unsigned int eb_size;
=2D	unsigned int total_ebs;
=2D	unsigned int avail_ebs;
=2D	unsigned int vol_count;
=2D};
=2D
=2D/**
=2D * struct ubi_vol_info - information about an UBI volume
=2D *
=2D * @bytes        volume size in bytes
=2D * @eraseblocks  volume size in eraseblocks
=2D * @major        major number of the corresponding character device
=2D * @minor        minor number of the corresponding character device
=2D * @type         volume type (%UBI_DYNAMIC_VOLUME or %UBI_STATIC_VOLUME)
=2D * @dev_path	 device path to volume
=2D * @name         volume name
=2D */
=2Dstruct ubi_vol_info
=2D{
=2D	unsigned long long bytes;
=2D	unsigned int eraseblocks;
=2D	unsigned int major;
=2D	unsigned int minor;
=2D	int type;
=2D	char *dev_path;
=2D	char *name;
=2D};
=2D
=2D/**
=2D * ubi_mkvol - create a dynamic UBI volume.
=2D *
=2D * @desc       UBI library descriptor
=2D * @devn       Number of UBI device to create new volume on
=2D * @vol_id     volume ID to assign to the new volume
=2D * @vol_type   volume type (%UBI_DYNAMIC_VOLUME or %UBI_STATIC_VOLUME)
=2D * @bytes      volume size in bytes
=2D * @alignment  volume alignment
=2D * @name       volume name
=2D *
=2D * This function creates new UBI volume. If @vol_id is %UBI_VOLN_AUTO, t=
hen
=2D * volume number is assigned automatically. This function returns positi=
ve
=2D * volume number of the new volume in case of success or %-1 in case of
=2D * failure.
=2D */
=2Dint ubi_mkvol(ubi_lib_t desc, int devn, int vol_id, int vol_type,
=2D	      long long bytes, int alignment, const char *name);
=2D
=2D/**
=2D * ubi_rmvol - remove a volume.
=2D *
=2D * @desc       UBI library descriptor
=2D * @devn       Number of UBI device to remove volume from
=2D * @vol_id     volume ID to remove
=2D *
=2D * This function returns zero in case of success or %-1 in case of failu=
re.
=2D */
=2Dint ubi_rmvol(ubi_lib_t desc, int devn, int vol_id);
=2D
=2D/**
=2D * ubi_get_info - get UBI information.
=2D *
=2D * @desc  UBI library descriptor
=2D * @ubi   UBI information is returned here
=2D *
=2D * This function retrieves information about UBI and puts it to @ubi. Re=
turns
=2D * zero in case of success and %-1 in case of failure.
=2D */
=2Dint ubi_get_info(ubi_lib_t desc, struct ubi_info *ubi);
=2D
=2D/**
=2D * ubi_vol_open - open a UBI volume
=2D *
=2D * @desc	UBI library descriptor
=2D * @devn	Number of UBI device on which to open the volume
=2D * @vol_id	Number of UBI device on which to open the volume
=2D * @flags	Flags to pass to open()
=2D *
=2D * This function opens a UBI volume on a given UBI device.  It returns
=2D * the file descriptor of the opened volume device.  In case of an
=2D * error %-1 is returned and errno is set appropriately.
=2D */
=2Dint ubi_vol_open(ubi_lib_t desc, int devn, int vol_id, int flags);
=2D
=2D/**
=2D * ubi_vol_close - close a UBI volume
=2D *
=2D * @vol_fd	file descriptor of UBI volume to close
=2D *
=2D * This function closes the given UBI device.
=2D */
=2Dint ubi_vol_close(int vol_fd);
=2D
=2D/**
=2D * ubi_vol_update - initiate volume update on a UBI volume
=2D * @vol_fd	File descriptor of UBI volume to update
=2D * @bytes	No. of bytes which shall be written.
=2D *
=2D * Initiates a volume update on a given volume.  The caller must then
=2D * actually write the appropriate number of bytes to the volume by
=2D * calling write().  Returns 0 on success, else error.
=2D */
=2Dint ubi_vol_update(int vol_fd, unsigned long long bytes);
=2D
=2D/**
=2D * ubi_vol_fopen_read - open a volume for reading, returning a FILE *
=2D * @desc	UBI library descriptor
=2D * @devn	UBI device number
=2D * @vol_id	volume ID to read
=2D *
=2D * Opens a volume for reading.  Reading itself can then be performed
=2D * with fread().  The stream can be closed with fclose().  Returns a
=2D * stream on success, else NULL.
=2D */
=2DFILE *
=2Dubi_vol_fopen_read(ubi_lib_t desc, int devn, uint32_t vol_id);
=2D
=2D/**
=2D * ubi_vol_fopen_update - open a volume for writing, returning a FILE *
=2D * @desc	UBI library descriptor
=2D * @devn	UBI device number
=2D * @vol_id	volume ID to update
=2D * @bytes	No. of bytes which shall be written.
=2D *
=2D * Initiates a volume update on a given volume.  The caller must then
=2D * actually write the appropriate number of bytes to the volume by
=2D * calling fwrite().  The file can be closed with fclose().  Returns a
=2D * stream on success, else NULL.
=2D */
=2DFILE *
=2Dubi_vol_fopen_update(ubi_lib_t desc, int devn, uint32_t vol_id,
=2D		     unsigned long long bytes);
=2D
=2D/**
=2D * ubi_vol_get_used_bytes - determine used bytes in a UBI volume
=2D * @vol_fd	File descriptor of UBI volume
=2D * @bytes	Pointer to result
=2D *
=2D * Returns 0 on success, else error.
=2D */
=2Dint ubi_vol_get_used_bytes(int vol_fd, unsigned long long *bytes);
=2D
=2D/**
=2D * ubi_open - open UBI library.
=2D *
=2D * @desc  A pointer to an UBI library descriptor
=2D *
=2D * Returns zero in case of success.
=2D */
=2Dint ubi_open(ubi_lib_t *desc);
=2D
=2D/**
=2D * ubi_close - close UBI library.
=2D *
=2D * @desc  A pointer to an UBI library descriptor
=2D */
=2Dint ubi_close(ubi_lib_t *desc);
=2D
=2D
=2D/**
=2D * ubi_perror - print UBI error.
=2D *
=2D * @prefix  a prefix string to prepend to the error message
=2D * @code    error code
=2D *
=2D * If @code is %-1, this function calls 'perror()'
=2D */
=2Dvoid ubi_perror(const char *prefix, int code);
=2D
=2D/**
=2D * ubi_set_cdev_pattern - set 'sprintf()'-like pattern of paths to UBI
=2D * character devices.
=2D *
=2D * @desc     UBI library descriptor
=2D * @pattern  the pattern to set
=2D *
=2D * The default UBI character device path is "/dev/ubi%u".
=2D */
=2Dint ubi_set_cdev_pattern(ubi_lib_t desc, const char *pattern);
=2D
=2D/**
=2D * ubi_get_dev_info get information about an UBI device.
=2D *
=2D * @desc  UBI library descriptor
=2D * @devn  UBI device number
=2D * @di    the requested information is returned here
=2D */
=2Dint ubi_get_dev_info(ubi_lib_t desc, unsigned int devn,
=2D		struct ubi_dev_info *di);
=2D
=2D/**
=2D * ubi_set_vol_cdev_pattern - set 'sprintf()'-like patt=B5ern ofpaths to=
 UBI
=2D * volume character devices.
=2D *
=2D * @desc     UBI library descriptor
=2D * @pattern  the pattern to set
=2D *
=2D * The default UBI character device path is "/dev/ubi%u_%u".
=2D */
=2Dint ubi_set_vol_cdev_pattern(ubi_lib_t desc, const char *pattern);
=2D
=2D/**
=2D * ubi_get_vol_info - get information about an UBI volume
=2D *
=2D * @desc  UBI library descriptor
=2D * @devn  UBI device number the volume belongs to
=2D * @vol_id  the requested volume number
=2D * @vi    volume information is returned here
=2D *
=2D * Users must free the volume name string @vi->name.
=2D */
=2Dint ubi_get_vol_info(ubi_lib_t desc, unsigned int devn, unsigned int vol=
_id,
=2D		struct ubi_vol_info *vi);
=2D
=2D#ifdef __cplusplus
=2D}
=2D#endif
=2D
=2D#endif /* !__UBI_H__ */
=2D-- mtd-utils.orig/ubi-utils/src/libubiold.c
+++ /dev/null
@@ -1,768 +0,0 @@
=2D/*
=2D * Copyright (c) International Business Machines Corp., 2006
=2D *
=2D * This program is free software; you can redistribute it and/or modify
=2D * it under the terms of the GNU General Public License as published by
=2D * the Free Software Foundation; either version 2 of the License, or
=2D * (at your option) any later version.
=2D *
=2D * This program is distributed in the hope that it will be useful,
=2D * but WITHOUT ANY WARRANTY; without even the implied warranty of
=2D * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
=2D * the GNU General Public License for more details.
=2D *
=2D * You should have received a copy of the GNU General Public License
=2D * along with this program; if not, write to the Free Software
=2D * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
=2D */
=2D
=2D/*
=2D * UBI (Unsorted Block Images) library.
=2D *
=2D * Author: Artem B. Bityutskiy
=2D *         Oliver Lohmann
=2D */
=2D
=2D#include <stdlib.h>
=2D#include <stdio.h>
=2D#include <string.h>
=2D#include <sys/stat.h>
=2D#include <fcntl.h>
=2D#include <unistd.h>
=2D#include <limits.h>
=2D#include <errno.h>
=2D#include <sys/ioctl.h>
=2D#include <stdint.h>
=2D#include <mtd/ubi-user.h>
=2D#include <mtd/ubi-header.h>
=2D
=2D#include "libubiold.h"
=2D#include "libubiold_int.h"
=2D#include "libubiold_sysfs.h"
=2D
=2D/**
=2D * struct ubi_lib - UBI library descriptor.
=2D *
=2D * @ubi		    general UBI information
=2D *
=2D * @sysfs_root	    sysfs root directory
=2D * @ubi_root	    UBI root directory in sysfs
=2D *
=2D * @version	    full path to the "UBI version" sysfs file
=2D *
=2D * @cdev_path	    path pattern to UBI character devices
=2D * @cdev_path_len   maximum length of the @cdev_path string after substi=
tution
=2D * @udev_path	    path to sysfs directories corresponding to UBI devices
=2D * @wear_path	    path to sysfs file containing UBI wear information
=2D * @vol_count_path  path to sysfs file containing the number of volumes =
in an
=2D *		    UBI device
=2D * @tot_ebs_path    path to sysfs file containing the total number of
=2D *		    eraseblock on an UBI device
=2D * @avail_ebs_path  path to sysfs file containing the number of unused
=2D *		    eraseblocks on an UBI device, available for new volumes
=2D * @eb_size_path    path to sysfs file containing size of UBI eraseblocks
=2D * @nums_path	    path to sysfs file containing major and minor number o=
f an
=2D *		    UBI device
=2D * @vol_cdev_path   path to UBI volume character devices
=2D * @vdev_path	    path to sysfs directories corresponding to UBI volume
=2D *		    devices
=2D * @vol_nums_path   path to sysfs file containing major and minor number=
 of an
=2D *		    UBI volume device
=2D * @vol_bytes_path  path to sysfs file containing size of an UBI volume =
device
=2D *		    in bytes
=2D * @vol_ebs_path    path to sysfs file containing the number of eraseblo=
cks in
=2D *		    an UBI volume device
=2D * @vol_type_path   path to sysfs file containing type of an UBI volume
=2D * @vol_name_path   @FIXME: Describe me.
=2D *
=2D * This structure is created and initialized by 'ubi_init()' and is pass=
ed to
=2D * all UBI library calls.
=2D */
=2Dstruct ubi_lib
=2D{
=2D	struct ubi_info ubi;
=2D
=2D	char *sysfs_root;
=2D	char *ubi_root;
=2D
=2D	char *version;
=2D	char *cdev_path;
=2D	int  cdev_path_len;
=2D	char *udev_path;
=2D	char *wear_path;
=2D	char *vol_count_path;
=2D	char *tot_ebs_path;
=2D	char *avail_ebs_path;
=2D	char *eb_size_path;
=2D	char *nums_path;
=2D	int  vol_cdev_path_len;
=2D	char *vol_cdev_path;
=2D	char *vdev_path;
=2D	char *vol_nums_path;
=2D	char *vol_bytes_path;
=2D	char *vol_ebs_path;
=2D	char *vol_type_path;
=2D	char *vol_name_path;
=2D};
=2D
=2D
=2D/**
=2D * mkpath - compose full path from 2 given components.
=2D *
=2D * @path  first component @name	 second component
=2D *
=2D * Returns the resulting path in case of success and %NULL in case of fa=
ilure.
=2D * Callers have to take care the resulting path is freed.
=2D */
=2Dstatic char*
=2Dmkpath(const char *path, const char *name)
=2D{
=2D	char *n;
=2D	int len1 =3D strlen(path);
=2D	int len2 =3D strlen(name);
=2D
=2D	n =3D malloc(len1 + len2 + 2);
=2D	if (!n)
=2D		return NULL;
=2D
=2D	memcpy(n, path, len1);
=2D	if (n[len1 - 1] !=3D '/')
=2D		n[len1++] =3D '/';
=2D
=2D	memcpy(n + len1, name, len2 + 1);
=2D	return n;
=2D}
=2D
=2D
=2Dstatic int
=2Dget_ubi_info(ubi_lib_t desc, struct ubi_info *ubi)
=2D{
=2D	int err;
=2D	int dev_count =3D 0;
=2D	char *path;
=2D	struct stat stat;
=2D
=2D	err =3D sysfs_read_int(desc->version, (int*) &ubi->version);
=2D	if (err)
=2D		return -1;
=2D
=2D	/* Calculate number of UBI devices */
=2D	while (!err) {
=2D		char dir[20];
=2D
=2D		sprintf(&dir[0], "ubi%d", dev_count);
=2D		path =3D mkpath(desc->ubi_root, dir);
=2D		if (!path)
=2D			return ENOMEM;
=2D
=2D		err =3D lstat(path, &stat);
=2D		if (err =3D=3D 0)
=2D			dev_count +=3D 1;
=2D		free(path);
=2D	}
=2D
=2D	if (errno !=3D ENOENT)
=2D		return -1;
=2D
=2D	if (dev_count =3D=3D 0) {
=2D		ubi_err("no UBI devices found");
=2D		errno =3D EINVAL;
=2D		return -1;
=2D	}
=2D
=2D	errno =3D 0;
=2D	ubi->dev_count =3D dev_count;
=2D	return 0;
=2D}
=2D
=2Dvoid
=2Dubi_dump_handler(ubi_lib_t desc)
=2D{
=2D	ubi_lib_t d =3D desc;
=2D	printf(	"UBI Library Descriptor:\n"
=2D		"ubi_root:	 %s\n"
=2D		"version:	 %s\n"
=2D		"cdev_path:	 %s\n"
=2D		"udev_path:	 %s\n"
=2D		"wear_path:	 %s\n"
=2D		"vol_count_path: %s\n"
=2D		"tot_ebs_path:	 %s\n"
=2D		"avail_ebs_path: %s\n"
=2D		"eb_size_path:	 %s\n"
=2D		"nums_path:	 %s\n"
=2D		"vol_cdev_path:	 %s\n"
=2D		"vdev_path:	 %s\n"
=2D		"vol_nums_path:	 %s\n"
=2D		"vol_bytes_path: %s\n"
=2D		"vol_ebs_path:	 %s\n"
=2D		"vol_type_path:	 %s\n"
=2D		"vol_name_path:	 %s\n"
=2D		"cdev_path_len:	 %d\n\n",
=2D	       d->ubi_root, d->version, d->cdev_path, d->udev_path,
=2D	       d->wear_path, d->vol_count_path, d->tot_ebs_path,
=2D	       d->avail_ebs_path, d->eb_size_path, d->nums_path,
=2D	       d->vol_cdev_path, d->vdev_path, d->vol_nums_path,
=2D	       d->vol_bytes_path, d->vol_ebs_path, d->vol_type_path,
=2D	       d->vol_name_path, d->cdev_path_len);
=2D}
=2D
=2Dint
=2Dubi_set_cdev_pattern(ubi_lib_t desc, const char *pattern)
=2D{
=2D	char *patt;
=2D
=2D	patt =3D strdup(pattern);
=2D	if (!patt) {
=2D		ubi_err("cannot allocate memory");
=2D		return -1;
=2D	}
=2D
=2D	if (desc->cdev_path)
=2D		free(desc->cdev_path);
=2D
=2D	desc->cdev_path =3D patt;
=2D	desc->cdev_path_len =3D strlen(patt) + 1 + UBI_MAX_ID_SIZE;
=2D
=2D	ubi_dbg("ubi dev pattern is now \"%s\"", patt);
=2D
=2D	return 0;
=2D}
=2D
=2Dint
=2Dubi_set_vol_cdev_pattern(ubi_lib_t desc, const char *pattern)
=2D{
=2D	char *patt;
=2D
=2D	patt =3D strdup(pattern);
=2D	if (!patt) {
=2D		ubi_err("cannot allocate memory");
=2D		return -1;
=2D	}
=2D
=2D	free(desc->vol_cdev_path);
=2D	desc->vol_cdev_path =3D patt;
=2D	desc->vol_cdev_path_len =3D strlen(patt) + 1 + 2 * UBI_MAX_ID_SIZE;
=2D
=2D	ubi_dbg("ubi volume dev pattern is now \"%s\"", patt);
=2D
=2D	return 0;
=2D}
=2D
=2Dint
=2Dubi_open(ubi_lib_t *desc)
=2D{
=2D	int err =3D -1;
=2D	ubi_lib_t res;
=2D	struct stat stat;
=2D
=2D	res =3D calloc(1, sizeof(struct ubi_lib));
=2D	if (!res) {
=2D		ubi_err("cannot allocate memory");
=2D		return -1;
=2D	}
=2D
=2D	res->cdev_path =3D NULL;
=2D	err =3D ubi_set_cdev_pattern(res, UBI_CDEV_PATH);
=2D	if (err)
=2D		goto error;
=2D
=2D	/* TODO: this actually has to be discovered */
=2D	res->sysfs_root =3D strdup(UBI_SYSFS_ROOT);
=2D	if (!res->sysfs_root)
=2D		goto error;
=2D
=2D	res->ubi_root =3D mkpath(res->sysfs_root, UBI_ROOT);
=2D	if (!res->ubi_root)
=2D		goto error;
=2D
=2D	res->version =3D	mkpath(res->ubi_root, UBI_VER);
=2D	if (!res->version)
=2D		goto error;
=2D
=2D	res->udev_path =3D mkpath(res->ubi_root, "ubi%d/");
=2D	if (!res->udev_path)
=2D		goto error;
=2D
=2D	res->wear_path =3D mkpath(res->udev_path, UBI_WEAR);
=2D	if (!res->wear_path)
=2D		goto error;
=2D
=2D	res->vol_count_path =3D mkpath(res->udev_path, UBI_VOL_COUNT);
=2D	if (!res->vol_count_path)
=2D		goto error;
=2D
=2D	res->tot_ebs_path =3D mkpath(res->udev_path, UBI_AVAIL_EBS);
=2D	if (!res->tot_ebs_path)
=2D		goto error;
=2D
=2D	res->avail_ebs_path =3D mkpath(res->udev_path, UBI_TOT_EBS);
=2D	if (!res->avail_ebs_path)
=2D		goto error;
=2D
=2D	res->eb_size_path =3D mkpath(res->udev_path, UBI_EB_SIZE);
=2D	if (!res->eb_size_path)
=2D		goto error;
=2D
=2D	res->nums_path =3D mkpath(res->udev_path, UBI_NUMS);
=2D	if (!res->nums_path)
=2D		goto error;
=2D
=2D	err =3D ubi_set_vol_cdev_pattern(res, UBI_VOL_CDEV_PATH);
=2D	if (err)
=2D		goto error;
=2D
=2D	res->vdev_path =3D mkpath(res->ubi_root, "ubi%d_%d/");
=2D	if (!res->vdev_path)
=2D		goto error;
=2D
=2D	res->vol_nums_path =3D mkpath(res->vdev_path, UBI_NUMS);
=2D	if (!res->vol_nums_path)
=2D		goto error;
=2D
=2D	res->vol_bytes_path =3D mkpath(res->vdev_path, UBI_VBYTES);
=2D	if (!res->vol_bytes_path)
=2D		goto error;
=2D
=2D	res->vol_ebs_path =3D mkpath(res->vdev_path, UBI_VEBS);
=2D	if (!res->vol_ebs_path)
=2D		goto error;
=2D
=2D	res->vol_type_path =3D mkpath(res->vdev_path, UBI_VTYPE);
=2D	if (!res->vol_type_path)
=2D		goto error;
=2D
=2D	res->vol_name_path =3D mkpath(res->vdev_path, UBI_VNAME);
=2D	if (!res->vol_name_path)
=2D		goto error;
=2D
=2D	/* Check if UBI exists in the system */
=2D	err =3D lstat(res->ubi_root, &stat);
=2D	if (err) {
=2D		perror("lstat");
=2D		fprintf(stderr, "%s\n", res->ubi_root);
=2D		err =3D UBI_ENOTFOUND;
=2D		goto error;
=2D	}
=2D
=2D	err =3D get_ubi_info(res, &res->ubi);
=2D	if (err)
=2D		goto error;
=2D
=2D	*desc =3D res;
=2D
=2D	ubi_dbg("opened library successfully.");
=2D
=2D	return 0;
=2D
=2Derror:
=2D	ubi_close(&res);
=2D
=2D	if (err =3D=3D -1 && errno =3D=3D ENOMEM)
=2D		ubi_err("Cannot allocate memory");
=2D
=2D	return err;
=2D}
=2D
=2Dint
=2Dubi_close(ubi_lib_t *desc)
=2D{
=2D	ubi_lib_t tmp =3D *desc;
=2D
=2D	free(tmp->vol_name_path);
=2D	free(tmp->vol_type_path);
=2D	free(tmp->vol_ebs_path);
=2D	free(tmp->vol_bytes_path);
=2D	free(tmp->vol_nums_path);
=2D	free(tmp->vdev_path);
=2D	free(tmp->vol_cdev_path);
=2D	free(tmp->nums_path);
=2D	free(tmp->eb_size_path);
=2D	free(tmp->avail_ebs_path);
=2D	free(tmp->tot_ebs_path);
=2D	free(tmp->vol_count_path);
=2D	free(tmp->wear_path);
=2D	free(tmp->udev_path);
=2D	free(tmp->cdev_path);
=2D	free(tmp->version);
=2D	free(tmp->ubi_root);
=2D	free(tmp->sysfs_root);
=2D	free(tmp);
=2D
=2D	*desc =3D NULL;
=2D
=2D	return 0;
=2D}
=2D
=2Dvoid
=2Dubi_perror(const char *prefix, int code)
=2D{
=2D	if (code =3D=3D 0)
=2D		return;
=2D
=2D	fprintf(stderr, "%s: ", prefix);
=2D
=2D	switch (code) {
=2D	case UBI_ENOTFOUND:
=2D		fprintf(stderr, "UBI was not found in system\n");
=2D		break;
=2D	case UBI_EBUG:
=2D		fprintf(stderr, "an UBI or UBI library bug\n");
=2D		break;
=2D	case UBI_EINVAL:
=2D		fprintf(stderr, "invalid parameter\n");
=2D		break;
=2D	case -1:
=2D		perror(prefix);
=2D		break;
=2D	default:
=2D		ubi_err("unknown error code %d", code);
=2D		break;
=2D	}
=2D}
=2D
=2Dint
=2Dubi_get_dev_info(ubi_lib_t desc, unsigned int devn, struct ubi_dev_info =
*di)
=2D{
=2D	int err;
=2D
=2D	if (devn >=3D desc->ubi.dev_count) {
=2D		ubi_err("bad device number, max is %d\n",
=2D			desc->ubi.dev_count - 1);
=2D		return UBI_EINVAL;
=2D	}
=2D
=2D	err =3D sysfs_read_dev_subst(desc->nums_path, &di->major,
=2D				   &di->minor, 1, devn);
=2D	if (err)
=2D		return -1;
=2D
=2D	err =3D sysfs_read_ull_subst(desc->wear_path, &di->wear, 1, devn);
=2D	if (err)
=2D		return -1;
=2D
=2D	err =3D sysfs_read_uint_subst(desc->vol_count_path,
=2D				    &di->vol_count, 1, devn);
=2D	if (err)
=2D		return -1;
=2D
=2D	err =3D sysfs_read_uint_subst(desc->eb_size_path, &di->eb_size, 1, devn=
);
=2D	if (err)
=2D		return -1;
=2D
=2D	err =3D sysfs_read_uint_subst(desc->tot_ebs_path, &di->total_ebs, 1, de=
vn);
=2D	if (err)
=2D		return -1;
=2D
=2D	err =3D sysfs_read_uint_subst(desc->avail_ebs_path,
=2D				    &di->avail_ebs, 1, devn);
=2D	if (err)
=2D		return -1;
=2D
=2D#if 0
=2D	ubi_dbg("major:minor %d:%d, wear %llu, EB size %d, "
=2D		"vol. count %d, tot. EBs %d, avail. EBs %d",
=2D		di->major, di->minor, di->wear, di->eb_size,
=2D		di->vol_count, di->total_ebs, di->avail_ebs);
=2D#endif
=2D
=2D	return err;
=2D}
=2D
=2Dint
=2Dubi_get_vol_info(ubi_lib_t desc, unsigned int devn, unsigned int vol_id,
=2D		struct ubi_vol_info *req)
=2D{
=2D	int err;
=2D	int len;
=2D	char buf1[10];
=2D	char buf2[UBI_MAX_VOLUME_NAME];
=2D
=2D	err =3D sysfs_read_dev_subst(desc->vol_nums_path, &req->major,
=2D				   &req->minor, 2, devn, vol_id);
=2D	if (err)
=2D		return -1;
=2D
=2D	err =3D sysfs_read_ull_subst(desc->vol_bytes_path,
=2D				   &req->bytes, 2, devn, vol_id);
=2D	if (err)
=2D		return -1;
=2D
=2D	err =3D sysfs_read_uint_subst(desc->vol_ebs_path,
=2D				    &req->eraseblocks, 2, devn, vol_id);
=2D	if (err)
=2D		return -1;
=2D
=2D	len =3D sysfs_read_data_subst(desc->vol_type_path, &buf1[0],
=2D				    10, 2,  devn, vol_id);
=2D	if (len =3D=3D -1)
=2D		return -1;
=2D
=2D	if (buf1[len - 1] !=3D '\n') {
=2D		ubi_err("bad volume type");
=2D		return UBI_EBUG;
=2D	}
=2D
=2D	if (!strncmp(&buf1[0], "static", sizeof("static") - 1)) {
=2D		req->type =3D UBI_STATIC_VOLUME;
=2D	} else if (!strncmp(&buf1[0], "dynamic", sizeof("dynamic") - 1)) {
=2D		req->type =3D UBI_DYNAMIC_VOLUME;
=2D	} else {
=2D		ubi_err("bad type %s", &buf1[0]);
=2D		return -1;
=2D	}
=2D
=2D	len =3D sysfs_read_data_subst(desc->vol_name_path, &buf2[0],
=2D				    UBI_MAX_VOLUME_NAME, 2,  devn, vol_id);
=2D	if (len =3D=3D -1)
=2D		return -1;
=2D
=2D	if (buf2[len - 1] !=3D '\n') {
=2D		ubi_err("bad volume name");
=2D		return UBI_EBUG;
=2D	}
=2D
=2D	req->name =3D malloc(len);
=2D	if (!req->name) {
=2D		ubi_err("cannot allocate memory");
=2D		return -1;
=2D	}
=2D
=2D	memcpy(req->name, &buf2[0], len - 1);
=2D	req->name[len - 1] =3D '\0';
=2D
=2D	return 0;
=2D}
=2D
=2D/**
=2D * ubi_cdev_open - open a UBI device
=2D *
=2D * @desc	UBI library descriptor
=2D * @devn	Number of UBI device to open
=2D * @flags	Flags to pass to open()
=2D *
=2D * This function opens a UBI device by number and returns a file
=2D * descriptor.  In case of an error %-1 is returned and errno is set
=2D * appropriately.
=2D */
=2Dstatic int
=2Dubi_cdev_open(ubi_lib_t desc, int devn, int flags)
=2D{
=2D	char *buf;
=2D	int fd;
=2D
=2D	ubi_dbg("desc=3D%p, devn=3D%d, flags=3D%08x\n", desc, devn, flags);
=2D
=2D	if (desc =3D=3D NULL) {
=2D		ubi_err("desc is NULL\n");
=2D		return -1;
=2D	}
=2D	if (desc->vol_cdev_path_len =3D=3D 0) {
=2D		ubi_err("path_len =3D=3D 0\n");
=2D		return -1;
=2D	}
=2D	buf =3D malloc(desc->cdev_path_len);
=2D
=2D	sprintf(buf, desc->cdev_path, devn);
=2D
=2D	fd =3D open(buf, flags);
=2D	if (fd =3D=3D -1)
=2D		ubi_dbg("cannot open %s", buf);
=2D
=2D	free(buf);
=2D	return fd;
=2D}
=2D
=2D/**
=2D * ubi_cdev_close - close a UBI device
=2D *
=2D * @dev_fd	file descriptor of UBI device to close
=2D *
=2D * This function closes the given UBI device.
=2D */
=2Dstatic int
=2Dubi_cdev_close(int dev_fd)
=2D{
=2D	return close(dev_fd);
=2D}
=2D
=2D/**
=2D * @size is now in bytes.
=2D */
=2Dint
=2Dubi_mkvol(ubi_lib_t desc, int devn, int vol_id, int vol_type,
=2D	  long long bytes, int alignment, const char *name)
=2D{
=2D	int fd;
=2D	int err;
=2D	struct ubi_mkvol_req req;
=2D	size_t n;
=2D
=2D	n =3D strlen(name);
=2D	if (n > UBI_MAX_VOLUME_NAME)
=2D		return -1;
=2D
=2D	if ((fd =3D ubi_cdev_open(desc, devn, O_RDWR)) =3D=3D -1)
=2D		return -1;
=2D
=2D	req.vol_id =3D vol_id;
=2D	req.bytes =3D bytes;
=2D	req.vol_type =3D vol_type;
=2D	req.alignment =3D alignment;
=2D
=2D	strncpy(req.name, name, UBI_MAX_VOLUME_NAME + 1);
=2D	req.name_len =3D n;
=2D
=2D	/* printf("DBG: %s(vol_id=3D%d, bytes=3D%lld, type=3D%d, alig=3D%d, nle=
n=3D%d, "
=2D	       "name=3D%s)\n", __func__, vol_id, bytes, vol_type, alignment,
=2D	       strlen(name), name);*/
=2D
=2D	err =3D ioctl(fd, UBI_IOCMKVOL, &req);
=2D	if (err < 0) {
=2D		ubi_err("ioctl returned %d errno=3D%d\n", err, errno);
=2D		goto out_close;
=2D	}
=2D
=2D	ubi_dbg("created volume %d, size %lld, name \"%s\" "
=2D		"at UBI dev %d\n", vol_id, bytes, name, devn);
=2D
=2D	close(fd);
=2D	return err;
=2D out_close:
=2D	ubi_cdev_close(fd);
=2D	return err;
=2D}
=2D
=2Dint
=2Dubi_rmvol(ubi_lib_t desc, int devn, int vol_id)
=2D{
=2D	int fd;
=2D	int err;
=2D
=2D	if ((fd =3D ubi_cdev_open(desc, devn, O_RDWR)) =3D=3D -1)
=2D		return -1;
=2D
=2D	err =3D ioctl(fd, UBI_IOCRMVOL, &vol_id);
=2D	if (err < 0)
=2D		goto out_close;
=2D
=2D	ubi_dbg("removed volume %d", vol_id);
=2D
=2D out_close:
=2D	ubi_cdev_close(fd);
=2D	return err;
=2D}
=2D
=2Dint
=2Dubi_get_info(ubi_lib_t desc, struct ubi_info *ubi)
=2D{
=2D	memcpy(ubi, &desc->ubi, sizeof(struct ubi_info));
=2D	return 0;
=2D}
=2D
=2D
=2Dint
=2Dubi_vol_open(ubi_lib_t desc, int devn, int vol_id, int flags)
=2D{
=2D	char *buf;
=2D	int fd;
=2D
=2D	ubi_dbg("desc=3D%p, devn=3D%d, vol_id=3D%d, flags=3D%08x\n",
=2D		desc, devn, vol_id, flags);
=2D
=2D	if (desc =3D=3D NULL) {
=2D		ubi_err("desc is NULL\n");
=2D		return -1;
=2D	}
=2D	if (desc->vol_cdev_path_len =3D=3D 0) {
=2D		ubi_err("path_len =3D=3D 0\n");
=2D		return -1;
=2D	}
=2D	buf =3D malloc(desc->cdev_path_len);
=2D
=2D	sprintf(buf, desc->vol_cdev_path, devn, vol_id);
=2D
=2D	fd =3D open(buf, flags);
=2D	if (fd =3D=3D -1)
=2D		ubi_dbg("cannot open %s", buf);
=2D
=2D	free(buf);
=2D	return fd;
=2D}
=2D
=2Dint
=2Dubi_vol_close(int vol_fd)
=2D{
=2D	return close(vol_fd);
=2D}
=2D
=2D
=2Dint
=2Dubi_vol_update(int vol_fd, unsigned long long bytes)
=2D{
=2D	int err;
=2D
=2D	err =3D ioctl(vol_fd, UBI_IOCVOLUP, &bytes);
=2D	if (err) {
=2D		ubi_err("%s failure calling update ioctl\n"
=2D			"    IOCTL(%08lx) err=3D%d errno=3D%d\n",
=2D			__func__, (long unsigned int)UBI_IOCVOLUP, err, errno);
=2D	}
=2D	return err;
=2D}
=2D
=2DFILE *
=2Dubi_vol_fopen_read(ubi_lib_t desc, int devn, uint32_t vol_id)
=2D{
=2D	FILE *fp;
=2D	int fd;
=2D
=2D	fd =3D ubi_vol_open(desc, devn, vol_id, O_RDONLY);
=2D	if (fd =3D=3D -1)
=2D		return NULL;
=2D
=2D	fp =3D fdopen(fd, "r");
=2D	if (fp =3D=3D NULL)
=2D		ubi_vol_close(fd);
=2D
=2D	return fp;
=2D}
=2D
=2DFILE *
=2Dubi_vol_fopen_update(ubi_lib_t desc, int devn, uint32_t vol_id,
=2D		     unsigned long long bytes)
=2D{
=2D	FILE *fp;
=2D	int fd;
=2D	int err;
=2D
=2D	fd =3D ubi_vol_open(desc, devn, vol_id, O_RDWR);
=2D	if (fd =3D=3D -1)
=2D		return NULL;
=2D
=2D	fp =3D fdopen(fd, "r+");
=2D	if (fp =3D=3D NULL) {
=2D		printf("DBG: %s(errno=3D%d)\n", __func__, errno);
=2D		ubi_vol_close(fd);
=2D		return NULL;
=2D	}
=2D	err =3D ubi_vol_update(fd, bytes);
=2D	if (err < 0) {
=2D		printf("DBG: %s() fd=3D%d err=3D%d\n", __func__, fd, err);
=2D		fclose(fp);
=2D		return NULL;
=2D	}
=2D	return fp;
=2D}
=2D
=2Dint
=2Dubi_vol_get_used_bytes(int vol_fd, unsigned long long *bytes)
=2D{
=2D	off_t res;
=2D
=2D	res =3D lseek(vol_fd, 0, SEEK_END);
=2D	if (res =3D=3D (off_t)-1)
=2D		return -1;
=2D	*bytes =3D (unsigned long long) res;
=2D	res =3D lseek(vol_fd, 0, SEEK_SET);
=2D	return res =3D=3D (off_t)-1 ? -1 : 0;
=2D}
=2D-- mtd-utils.orig/ubi-utils/src/libubiold_int.h
+++ /dev/null
@@ -1,119 +0,0 @@
=2D/*
=2D * Copyright (c) International Business Machines Corp., 2006
=2D *
=2D * This program is free software; you can redistribute it and/or modify
=2D * it under the terms of the GNU General Public License as published by
=2D * the Free Software Foundation; either version 2 of the License, or
=2D * (at your option) any later version.
=2D *
=2D * This program is distributed in the hope that it will be useful,
=2D * but WITHOUT ANY WARRANTY; without even the implied warranty of
=2D * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
=2D * the GNU General Public License for more details.
=2D *
=2D * You should have received a copy of the GNU General Public License
=2D * along with this program; if not, write to the Free Software
=2D * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
=2D */
=2D
=2D/*
=2D * UBI (Unsorted Block Images) library.
=2D *
=2D * Author: Artem B. Bityutskiy
=2D */
=2D
=2D#ifndef __UBI_INT_H__
=2D#define __UBI_INT_H__
=2D/*
=2D * Enable/disable UBI library debugging messages.
=2D */
=2D#undef UBILIB_DEBUG
=2D
=2D/*
=2D * UBI library error message.
=2D */
=2D#define ubi_err(fmt, ...) do {						\
=2D		fprintf(stderr, "UBI Library Error at %s: ", __func__); \
=2D		fprintf(stderr, fmt, ##__VA_ARGS__);			\
=2D		fprintf(stderr, "\n");					\
=2D	} while (0)
=2D
=2D#ifdef UBILIB_DEBUG
=2D#define ubi_dbg(fmt, ...) do {						\
=2D		fprintf(stderr, "UBI Debug: %s: ", __func__);		\
=2D		fprintf(stderr, fmt, ##__VA_ARGS__);			\
=2D		fprintf(stderr, "\n");					\
=2D	} while (0)
=2D
=2D#else
=2D#define ubi_dbg(fmt, ...) do { } while (0)
=2D#endif
=2D
=2D/**
=2D * SYSFS Entries.
=2D *
=2D * @def UBI_ROOT
=2D *	@brief Name of the root UBI directory in sysfs.
=2D *
=2D * @def UBI_NLEN_MAX
=2D *	@brief Name of syfs file containing the maximum UBI volume name lengt=
h.
=2D *
=2D * @def UBI_VER
=2D *      @brief Name of sysfs file containing UBI version.
=2D *
=2D * @def UBI_WEAR
=2D *	@brief Name of sysfs file containing wear level of an UBI device.
=2D *
=2D * @def UBI_VOL_COUNT
=2D *	@brief Name of sysfs file contaning the of volume on an UBI device
=2D *
=2D * @def UBI_TOT_EBS
=2D *	@brief Name of sysfs file contaning the total number of
=2D *	eraseblocks on an UBI device.
=2D *
=2D * @def UBI_AVAIL_EBS
=2D *	@brief Name of sysfs file contaning the number of unused eraseblocks =
on
=2D *	an UBI device.
=2D *
=2D * @def UBI_EB_SIZE
=2D *	@brief Name of sysfs file containing size of UBI eraseblocks.
=2D *
=2D * @def UBI_NUMS
=2D *      @brief Name of sysfs file containing major and minor numbers
=2D *      of an UBI device or an UBI volume device.
=2D *
=2D * @def UBI_VBYTES
=2D *	@brief Name of sysfs file containing size of an UBI volume device in
=2D *	bytes.
=2D *
=2D * @def UBI_VEBS
=2D *	@brief Name of sysfs file containing size of an UBI volume device in
=2D *	eraseblocks.
=2D *
=2D * @def UBI_VTYPE
=2D *	@brief Name of sysfs file containing type of an UBI volume device.
=2D *
=2D * @def UBI_VNAME
=2D *	@brief Name of sysfs file containing name of an UBI volume device.
=2D **/
=2D#define UBI_ROOT	"ubi"
=2D#define UBI_NLEN_MAX	"volume_name_max"
=2D#define UBI_VER		"version"
=2D#define UBI_WEAR	"wear"
=2D#define UBI_VOL_COUNT	"volumes_count"
=2D#define UBI_TOT_EBS	"total_eraseblocks"
=2D#define UBI_AVAIL_EBS	"avail_eraseblocks"
=2D#define UBI_EB_SIZE	"eraseblock_size"
=2D#define UBI_NUMS	"dev"
=2D#define UBI_VBYTES	"bytes"
=2D#define UBI_VEBS	"eraseblocks"
=2D#define UBI_VTYPE	"type"
=2D#define UBI_VNAME	"name"
=2D
=2D#define UBI_CDEV_PATH	"/dev/ubi%d"
=2D#define UBI_VOL_CDEV_PATH "/dev/ubi%d_%d"
=2D#define UBI_SYSFS_ROOT	"/sys/class"
=2D
=2D#define UBI_MAX_ID_SIZE	9
=2D
=2D#endif /* !__UBI_INT_H__ */
=2D-- mtd-utils.orig/ubi-utils/src/libubiold_sysfs.c
+++ /dev/null
@@ -1,232 +0,0 @@
=2D/*
=2D * Copyright (c) International Business Machines Corp., 2006
=2D *
=2D * This program is free software; you can redistribute it and/or modify
=2D * it under the terms of the GNU General Public License as published by
=2D * the Free Software Foundation; either version 2 of the License, or
=2D * (at your option) any later version.
=2D *
=2D * This program is distributed in the hope that it will be useful,
=2D * but WITHOUT ANY WARRANTY; without even the implied warranty of
=2D * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
=2D * the GNU General Public License for more details.
=2D *
=2D * You should have received a copy of the GNU General Public License
=2D * along with this program; if not, write to the Free Software
=2D * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
=2D */
=2D
=2D/*
=2D * UBI (Unsorted Block Images) library.
=2D *
=2D * Author: Artem B. Bityutskiy
=2D */
=2D
=2D#include <stdlib.h>
=2D#include <stdio.h>
=2D#include <string.h>
=2D#include <fcntl.h>
=2D#include <sys/stat.h>
=2D#include <unistd.h>
=2D#include <limits.h>
=2D#include <errno.h>
=2D#include <stdarg.h>
=2D
=2D#include "config.h"
=2D#include "libubiold_int.h"
=2D
=2Dint
=2Dsysfs_read_data(const char *file, void *buf, int len)
=2D{
=2D	int fd;
=2D	ssize_t rd;
=2D
=2D	fd =3D open(file, O_RDONLY);
=2D	if (fd =3D=3D -1) {
=2D		ubi_err("cannot open file %s", file);
=2D		return -1;
=2D	}
=2D
=2D	rd =3D read(fd, buf, len);
=2D	if (rd =3D=3D -1)
=2D		ubi_err("cannot read file %s", file);
=2D
=2D	close(fd);
=2D
=2D	return rd;
=2D}
=2D
=2Dint
=2Dsysfs_read_data_subst(const char *patt, void *buf, int len, int n, ...)
=2D{
=2D	va_list args;
=2D	char buf1[strlen(patt) + 20 * n];
=2D
=2D	va_start(args, n);
=2D	vsprintf(&buf1[0], patt, args);
=2D	va_end(args);
=2D
=2D	return sysfs_read_data(&buf1[0], buf, len);
=2D}
=2D
=2Dint
=2Dsysfs_read_dev(const char *file, unsigned int *major, unsigned int *mino=
r)
=2D{
=2D	int fd;
=2D	int ret;
=2D	ssize_t rd;
=2D	int err =3D -1;
=2D	char buf[40];
=2D
=2D	fd =3D open(file, O_RDONLY);
=2D	if (fd =3D=3D -1) {
=2D		ubi_err("cannot open file %s", file);
=2D		return -1;
=2D	}
=2D
=2D	rd =3D read(fd, &buf[0], 20);
=2D	if (rd =3D=3D -1) {
=2D		ubi_err("cannot read file %s", file);
=2D		goto error;
=2D	}
=2D	if (rd < 4) {
=2D		ubi_err("bad contents of file %s:", file);
=2D		goto error;
=2D	}
=2D
=2D	err =3D -1;
=2D	if (buf[rd -1] !=3D '\n') {
=2D		ubi_err("bad contents of file %s", file);
=2D		goto error;
=2D	}
=2D
=2D	ret =3D sscanf(&buf[0], "%d:%d\n", major, minor);
=2D	if (ret !=3D 2) {
=2D		ubi_err("bad contents of file %s", file);
=2D		goto error;
=2D	}
=2D
=2D	err =3D 0;
=2D
=2Derror:
=2D	close(fd);
=2D
=2D	return err;
=2D}
=2D
=2Dint
=2Dsysfs_read_dev_subst(const char *patt, unsigned int *major,
=2D		unsigned int *minor, int n, ...)
=2D{
=2D	va_list args;
=2D	char buf[strlen(patt) + 20 * n];
=2D
=2D	va_start(args, n);
=2D	vsprintf(&buf[0], patt, args);
=2D	va_end(args);
=2D
=2D	return sysfs_read_dev(&buf[0], major, minor);
=2D}
=2D
=2Dstatic int
=2Dsysfs_read_ull(const char *file ubi_unused, unsigned long long *num ubi_=
unused)
=2D{
=2D	return 0;
=2D}
=2D
=2Dint
=2Dsysfs_read_ull_subst(const char *patt, unsigned long long *num, int n, .=
=2E.)
=2D{
=2D	va_list args;
=2D	char buf[strlen(patt) + 20 * n];
=2D
=2D	va_start(args, n);
=2D	vsprintf(&buf[0], patt, args);
=2D	va_end(args);
=2D
=2D	return	sysfs_read_ull(&buf[0], num);
=2D}
=2D
=2Dstatic int
=2Dsysfs_read_uint(const char *file ubi_unused, unsigned int *num ubi_unuse=
d)
=2D{
=2D	return 0;
=2D}
=2D
=2Dint
=2Dsysfs_read_uint_subst(const char *patt, unsigned int *num, int n, ...)
=2D{
=2D	va_list args;
=2D	char buf[strlen(patt) + 20 * n];
=2D
=2D	va_start(args, n);
=2D	vsprintf(&buf[0], patt, args);
=2D	va_end(args);
=2D
=2D	return	sysfs_read_uint(&buf[0], num);
=2D}
=2D
=2Dint
=2Dsysfs_read_ll(const char *file, long long *num)
=2D{
=2D	int fd;
=2D	ssize_t rd;
=2D	int err =3D -1;
=2D	char buf[20];
=2D	char *endptr;
=2D
=2D	fd =3D open(file, O_RDONLY);
=2D	if (fd =3D=3D -1)
=2D		return -1;
=2D
=2D	rd =3D read(fd, &buf[0], 20);
=2D	if (rd =3D=3D -1)
=2D		goto out;
=2D
=2D	if (rd < 2) {
=2D		ubi_err("bad contents in file %s: \"%c%c...\"",
=2D			file, buf[0], buf[1]);
=2D		goto out_errno;
=2D	}
=2D
=2D	*num =3D strtoll(&buf[0], &endptr, 10);
=2D	if (endptr =3D=3D &buf[0] || *endptr !=3D '\n') {
=2D		ubi_err("bad contents in file %s: \"%c%c...\"",
=2D			file, buf[0], buf[1]);
=2D		goto out_errno;
=2D	}
=2D
=2D	if  (*num < 0) {
=2D		ubi_err("bad number in file %s: %lld", file, *num);
=2D		goto out_errno;
=2D	}
=2D
=2D	err =3D 0;
=2D
=2Dout_errno:
=2D	errno =3D EINVAL;
=2D
=2Dout:
=2D	close(fd);
=2D	return err;
=2D}
=2D
=2Dint
=2Dsysfs_read_int(const char *file, int *num)
=2D{
=2D	int err;
=2D	long long res =3D 0;
=2D
=2D	err =3D sysfs_read_ll(file, &res);
=2D	if (err)
=2D		return err;
=2D
=2D	if (res < 0 || res > INT_MAX) {
=2D		ubi_err("bad number in file %s: %lld", file, res);
=2D		errno =3D EINVAL;
=2D		return -1;
=2D	}
=2D
=2D	*num =3D res;
=2D	return 0;
=2D}
=2D-- mtd-utils.orig/ubi-utils/src/libubiold_sysfs.h
+++ /dev/null
@@ -1,109 +0,0 @@
=2D/*
=2D * Copyright (c) International Business Machines Corp., 2006
=2D *
=2D * This program is free software; you can redistribute it and/or modify
=2D * it under the terms of the GNU General Public License as published by
=2D * the Free Software Foundation; either version 2 of the License, or
=2D * (at your option) any later version.
=2D *
=2D * This program is distributed in the hope that it will be useful,
=2D * but WITHOUT ANY WARRANTY; without even the implied warranty of
=2D * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See
=2D * the GNU General Public License for more details.
=2D *
=2D * You should have received a copy of the GNU General Public License
=2D * along with this program; if not, write to the Free Software
=2D * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
=2D */
=2D
=2D/*
=2D * UBI (Unsorted Block Images) library.
=2D *
=2D * Author: Artem B. Bityutskiy
=2D */
=2D
=2D/**
=2D * sysfs_read_data - read data from a sysfs file.
=2D *
=2D * @file  path to the file to read from
=2D * @buf	  furrer where to store read data
=2D * @len	  length of provided buffer @buf
=2D *
=2D * This function returns the number of read bytes or -1 in case of error.
=2D */
=2Dint sysfs_read_data(const char *file, void *buf, int len);
=2D
=2D/**
=2D * sysfs_read_data_subst - form path to a sysfs file and read data from =
it.
=2D *
=2D * @patt  path to the file to read from
=2D * @buf	  furrer where to store read data
=2D * @len	  length of provided buffer @buf
=2D * @n	  number of parameters to substitute to @patt
=2D *
=2D * This function forms path to a sysfs file by means of substituting par=
ameters
=2D * to @patt and then reads @len bytes from this file and stores the read=
 data
=2D * to @buf. This function returns the number of read bytes or -1 in case=
 of
=2D * error.
=2D */
=2Dint sysfs_read_data_subst(const char *patt, void *buf, int len, int n, .=
=2E.);
=2D
=2D/**
=2D * sysfs_read_dev - read major and minor number from a sysfs file.
=2D *
=2D * @file   path to the file to read from
=2D * @major  major number is returned here
=2D * @minor  minor number is returned here
=2D */
=2Dint sysfs_read_dev(const char *file, unsigned int *major,
=2D		unsigned int *minor);
=2D/**
=2D * sysfs_read_dev_subst - for path to a file and read major and minor nu=
mber
=2D * from it.
=2D *
=2D * @patt   pattern of the path to the file to read from
=2D * @major  major number is returned here
=2D * @minor  minor number is returned here
=2D * @n	   number of arguments to substitute
=2D *
=2D * This function substitures arguments to the @patt file path pattern an=
d reads
=2D * major and minor numbers from the resulting file.
=2D */
=2Dint sysfs_read_dev_subst(const char *patt, unsigned int *major,
=2D		unsigned int *minor, int n, ...);
=2D
=2D/**
=2D * sysfs_read_ull_subst - form path to a sysfs file and read an unsigned=
 long
=2D * long value from there.
=2D *
=2D * @patt  pattern of file path
=2D * @num	  the read value is returned here
=2D * @n	  number of parameters to substitute
=2D *
=2D *
=2D * This function first forms the path to a sysfs file by means of substi=
tuting
=2D * passed parameters to the @patt string, and then read an 'unsigned lon=
g long'
=2D * value from this file.
=2D */
=2Dint sysfs_read_ull_subst(const char *patt, unsigned long long *num,
=2D		int n, ...);
=2D
=2D/**
=2D * sysfs_read_uint_subst - the same as 'sysfs_read_uint_subst()' but rea=
ds an
=2D * unsigned int value.
=2D */
=2Dint sysfs_read_uint_subst(const char *patt, unsigned int *num,
=2D		int n, ...);
=2D
=2D/**
=2D * sysfs_read_ll - read a long long integer from an UBI sysfs file.
=2D *
=2D * @file  file name from where to read
=2D * @num	  the result is returned here
=2D */
=2Dint sysfs_read_ll(const char *file, long long *num);
=2D
=2D/**
=2D * sysfs_read_int - the same as 'sysfs_read_ll()' but reads an 'int' val=
ue.
=2D */
=2Dint sysfs_read_int(const char *file, int *num);
