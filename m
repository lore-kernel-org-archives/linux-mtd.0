Received: from usti.fccps.cz ([194.108.74.250])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C7vSV-00077j-RO
	for linux-mtd@lists.infradead.org; Thu, 16 Sep 2004 08:33:57 -0400
From: "Frantisek Rysanek" <Frantisek.Rysanek@post.cz>
To: dwmw2@infradead.org
Date: Thu, 16 Sep 2004 14:36:08 +0200
MIME-Version: 1.0
Content-type: Multipart/Mixed; boundary=Message-Boundary-5474
Message-ID: <4149A4D8.29869.10649001@localhost>
Cc: linux-mtd@lists.infradead.org
Subject: BLKRRPART bug + fix in mtd_blkdevs-24.c in
	mtd-snapshot-20040914.tar.bz2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--Message-Boundary-5474
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Dear Mr. Woodhouse,

I've found a bug in the functions serving the BLKRRPART 
ioctl() in the 2.4 branch of MTD blkdevs. See the attached 
patch, I believe it contains a fix.

My DiskOnChip was detected just fine, but when I flushed the 
original partition and issued a BLKRRPART, the device would 
report half its original size. If I did it again, it would
report a quarter size... etc.

Seems like the driver would re-init device size to a size 
denominated in 1k blocks, rather than sectors (512B).

Attached are two simple proggies that I'm using in my 
partitioning scripts.


Otherwise the driver seems to work just fine.
Actually I also had to insert 

#ifndef CONFIG_MTD_CFI_GEOMETRY
#define CONFIG_MTD_MAP_BANK_WIDTH_1
#endif

at the beginning of $KERNEL/include/linux/mtd/map.h

to make it compile. Seems like a dependency mismatch between 
drivers/mtd/chips/Config.in and the headers/code. I don't have 
a CFI MTD, but I do need drivers/mtd/chips/chipreg.o even for 
my DiskOnChip (now a generic NFTL device).


Thanks for the great job you're doing on MTD :-)

Frank Rysanek


--Message-Boundary-5474
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Text from file 'mtd_blkdevs-24.c.patch'

--- mtd_blkdevs-24.old.c	2004-09-16 12:51:08.000000000 +0200
+++ mtd_blkdevs-24.c	2004-09-16 12:54:38.000000000 +0200
@@ -315,7 +315,7 @@
 	}
 
 	grok_partitions(gd, minor, 1 << tr->part_bits, 
-			tr->blkcore_priv->sizes[minor]);
+			dev->size);
 	up(&mtd_table_mutex);
 
 	return 0;
--Message-Boundary-5474
Content-type: text/plain; charset=US-ASCII
Content-disposition: inline
Content-description: Attachment information.

The following section of this message contains a file attachment
prepared for transmission using the Internet MIME message format.
If you are using Pegasus Mail, or any other MIME-compliant system,
you should be able to save it or view it from within your mailer.
If you cannot, please ask your system administrator for assistance.

   ---- File information -----------
     File:  reset_disk.c
     Date:  16 Sep 2004, 13:23
     Size:  989 bytes.
     Type:  Program-source

--Message-Boundary-5474
Content-type: Application/Octet-stream; name="reset_disk.c";
	type=Program-source
Content-disposition: attachment; filename="reset_disk.c"
Content-transfer-encoding: BASE64

I2luY2x1ZGUgPHN0ZGlvLmg+ICAgICAgICAgLy8gZ2VuZXJhbCBJL08KI2luY2x1ZGUgPGZj
bnRsLmg+ICAgICAgICAgLy8gb3B0aW9ucyBmb3Igb3BlbigpCiNkZWZpbmUgT19MQVJHRUZJ
TEUgICAgMDEwMDAwMAojaW5jbHVkZSA8c3lzL2lvY3RsLmg+ICAgICAvLyBwcm92aWRlcyBp
b2N0bCgpCiNpbmNsdWRlIDxsaW51eC9mcy5oPiAgICAgIC8vIEJMS1JSUEFSVAoKaW50IG1h
aW4oaW50IGFyZ2MsIGNoYXIqKiBhcmd2LCBjaGFyKiogZW52KQp7CiBpbnQgZmQgPSAtMTsK
IGludCBlcnIgPSAwOwogY2hhciogZmlsZW5hbWUgPSBOVUxMOwoKICAgaWYgKGFyZ2MgPiAx
KQogICB7CiAgICAgIGZpbGVuYW1lID0gYXJndlsxXTsKICAgfSAKICAgZWxzZQogICB7CiAg
ICAgIHByaW50ZigiVXNhZ2UgZXhhbXBsZTogcmVzZXRfZGlzayAvZGV2L2hkYVxuIik7CiAg
ICAgIHByaW50ZigiQ2FsbHMgdGhlIEJMS1JSUEFSVCBpb2N0bCgpIHRvIG1ha2Uga2VybmVs
IHJlLXJlYWQgYW5kIHJlLWludGVycHJldCBwYXJ0aXRpb24gdGFibGUuXG4iKTsKICAgICAg
cHJpbnRmKCJUaGlzIG9ubHkgd29ya3MgaWYgbm8gZGV2aWNlcyAoZmlsZXN5c3RlbXMpIGFy
ZSBjdXJyZW50bHkgbW91bnRlZCBvZmYgdGhhdCBkaXNrLlxuIik7CiAgICAgIGV4aXQoMSk7
CiAgIH0KCiAgIGZkID0gb3BlbihmaWxlbmFtZSwgT19SRE9OTFl8T19MQVJHRUZJTEUpOwog
ICBpZiAoZmQgPD0gMCkKICAgewogICAgICBwcmludGYoIlVuYWJsZSB0byBvcGVuICVzLiBF
eGl0aW5nXG4iLCBmaWxlbmFtZSk7CiAgICAgIGV4aXQoMSk7CiAgIH0KCiAgIGVyciA9IGlv
Y3RsKDMsIEJMS1JSUEFSVCwgTlVMTCk7CiAgIGlmIChlcnIpCiAgIHsKICAgICAgcHJpbnRm
KCJFcnJvciByZS1yZWFkaW5nIHBhcnRpdGlvbiB0YWJsZXMgdXNpbmcgdGhlIEJMS1JSUEFS
VCBpb2N0bCgpLlxuIik7CiAgICAgIGV4aXQoMSk7CiAgIH0KCiAgIGNsb3NlKGZkKTsKICAg
CiAgIHJldHVybigwKTsKfQo=
--Message-Boundary-5474
Content-type: text/plain; charset=US-ASCII
Content-disposition: inline
Content-description: Attachment information.

The following section of this message contains a file attachment
prepared for transmission using the Internet MIME message format.
If you are using Pegasus Mail, or any other MIME-compliant system,
you should be able to save it or view it from within your mailer.
If you cannot, please ask your system administrator for assistance.

   ---- File information -----------
     File:  geom.c
     Date:  16 Sep 2004, 13:23
     Size:  1569 bytes.
     Type:  Program-source

--Message-Boundary-5474
Content-type: Application/Octet-stream; name="geom.c"; type=Program-source
Content-disposition: attachment; filename="geom.c"
Content-transfer-encoding: BASE64

I2luY2x1ZGUgPHN0ZGlvLmg+ICAgICAgICAgLy8gZ2VuZXJhbCBJL08KI2luY2x1ZGUgPGZj
bnRsLmg+ICAgICAgICAgLy8gb3B0aW9ucyBmb3Igb3BlbigpCiNkZWZpbmUgT19MQVJHRUZJ
TEUgICAgMDEwMDAwMAojaW5jbHVkZSA8c3lzL2lvY3RsLmg+ICAgICAvLyBwcm92aWRlcyBp
b2N0bCgpCiNpbmNsdWRlIDxsaW51eC9mcy5oPiAgICAgIC8vIEJMS0dFVFNJWkUKI2luY2x1
ZGUgPGxpbnV4L2hkcmVnLmg+ICAgLy8gSERJT19HRVRHRU9fQklHCgppbnQgbWFpbihpbnQg
YXJnYywgY2hhcioqIGFyZ3YsIGNoYXIqKiBlbnYpCnsKIGludCBmZCA9IC0xOwogaW50IGVy
ciA9IDA7CiBzdHJ1Y3QgaGRfYmlnX2dlb21ldHJ5IGJpZ19nZW9tOyAgIC8vIHVuc2lnbmVk
IGludCBjeWxzCiBzdHJ1Y3QgaGRfZ2VvbWV0cnkgZ2VvbTsgICAgICAgICAgIC8vIHVuc2ln
bmVkIHNob3J0IGN5bHMKIHVuc2lnbmVkIGludCBzaXplID0gMDsKIGNoYXIqIGZpbGVuYW1l
ID0gTlVMTDsKCiAgIGlmIChhcmdjID4gMSkKICAgewogICAgICBmaWxlbmFtZSA9IGFyZ3Zb
MV07CiAgIH0gCiAgIGVsc2UKICAgewogICAgICBwcmludGYoIlVzYWdlIGV4YW1wbGU6IGdl
b20gL2Rldi9oZGFcbiIpOwogICAgICBwcmludGYoIk91dHB1dDogIEN5bGluZGVycy9IZWFk
cy9TZWN0b3JzX3Blcl90cmFjay9DYXBhY2l0eSAgIChpbiBzZWN0b3JzKVxuIik7CiAgICAg
IGV4aXQoMSk7CiAgIH0KCiAgICAgIAogICBmZCA9IG9wZW4oZmlsZW5hbWUsIE9fUkRPTkxZ
fE9fTEFSR0VGSUxFKTsKICAgaWYgKGZkIDw9IDApCiAgIHsKICAgICAgcHJpbnRmKCJVbmFi
bGUgdG8gb3BlbiAlcy4gRXhpdGluZ1xuIiwgZmlsZW5hbWUpOwogICAgICBleGl0KDEpOwog
ICB9CgogICBlcnIgPSBpb2N0bCgzLCBCTEtHRVRTSVpFLCAmc2l6ZSk7CiAgIGlmIChlcnIp
CiAgIHsKICAgICAgcHJpbnRmKCJFcnJvciBnZXR0aW5nIGNhcGFjaXR5IHVzaW5nIEJMS0dF
VFNJWkVcbiIpOwogICAgICBleGl0KDEpOwogICB9CgogICBnZW9tLmN5bGluZGVycyA9IDA7
CiAgIGdlb20uaGVhZHMgPSAwOwogICBnZW9tLnNlY3RvcnMgPSAwOwogICBlcnIgPSBpb2N0
bCgzLCBIRElPX0dFVEdFT19CSUcsICZiaWdfZ2VvbSk7CiAgIGlmIChlcnIpCiAgIHsKICAg
ICAgZXJyID0gaW9jdGwoMywgSERJT19HRVRHRU8sICZnZW9tKTsKICAgICAgaWYgKGVycikK
ICAgICAgewogICAgICAgICBwcmludGYoIkVycm9yIHJldHJpZXZpbmcgZ2VvbWV0cnkgLSBi
b3RoIEhESU9fR0VUR0VPX0JJRyBhbmQgSERJT19HRVRHRU8gZmFpbGVkLlxuIik7CiAgICAg
ICAgIGV4aXQoMSk7CiAgICAgIH0KICAgICAgZWxzZQogICAgICB7CiAgICAgICAgIHByaW50
ZigiJXUvJXUvJXUvJXVcbiIsZ2VvbS5jeWxpbmRlcnMsIGdlb20uaGVhZHMsIGdlb20uc2Vj
dG9ycywgc2l6ZSk7CiAgICAgIH0KICAgfQogICBlbHNlCiAgIHsKICAgICAgcHJpbnRmKCIl
dS8ldS8ldS8ldVxuIixiaWdfZ2VvbS5jeWxpbmRlcnMsIGJpZ19nZW9tLmhlYWRzLCBiaWdf
Z2VvbS5zZWN0b3JzLCBzaXplKTsKICAgfQoKICAgY2xvc2UoZmQpOwogICByZXR1cm4oMCk7
Cn0K

--Message-Boundary-5474--
