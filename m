Received: from elasmtp-junco.atl.sa.earthlink.net ([209.86.89.63])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FeJjw-0002c8-PO
	for linux-mtd@lists.infradead.org; Thu, 11 May 2006 23:34:37 +0100
Received: from [209.86.224.34] (helo=elwamui-hound.atl.sa.earthlink.net)
	by elasmtp-junco.atl.sa.earthlink.net with asmtp (Exim 4.34)
	id 1FeJjV-0000bT-Ln
	for linux-mtd@lists.infradead.org; Thu, 11 May 2006 18:34:09 -0400
Message-ID: <25152037.1147386849527.JavaMail.root@elwamui-hound.atl.sa.earthlink.net>
Date: Thu, 11 May 2006 15:34:09 -0700 (GMT-07:00)
From: Steve Finney <saf76@earthlink.net>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_13278_33409287.1147386849265"
Subject: [PATCH 2/3] MTD Utils. (Resubmit as attachment)
Reply-To: Steve Finney <saf76@earthlink.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

------=_Part_13278_33409287.1147386849265
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Modify nandwrite to accept hex argument for "-s" argument; also
make an error message more accurate.

Signed-off-by: Steven Finney <sfinney@healthhero.com>

------=_Part_13278_33409287.1147386849265
Content-Disposition: attachment; filename="patch.nandwrite"
Content-Type: application/octet-stream; name=patch.nandwrite
Content-Transfer-Encoding: 7bit

Modify nandwrite to accept hex argument for "-s" argument; also
make an error message more accurate.

Signed-off-by: Steven Finney <sfinney@healthhero.com>

------------------------------

--- util.orig/nandwrite.c	2006-05-02 07:52:41.000000000 -0700
+++ util/nandwrite.c	2006-05-10 11:51:46.000000000 -0700
@@ -183,7 +183,7 @@ void process_options (int argc, char *ar
 			pad = 1;
 			break;
 		case 's':
-			mtdoffset = atoi (optarg);
+			mtdoffset = strtol (optarg, NULL, 0);
 			break;
 		case 'b':
 			blockalign = atoi (optarg);
@@ -451,7 +451,7 @@ int main(int argc, char **argv)
 	close(fd);
 
 	if (imglen > 0) {
-		perror ("Data did not fit into device, due to bad blocks\n");
+		perror ("Data was only partially written due to error\n");
 		exit (1);
 	}
 

------=_Part_13278_33409287.1147386849265--
