Received: from [66.220.10.164] (helo=mail.rinconhosting.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 192cF3-0006vX-6g
	for <linux-mtd@lists.infradead.org>; Mon, 07 Apr 2003 20:25:17 +0100
Received: from dirt ([66.68.146.73])
        by mail.rinconhosting.com (Merak 5.5.7) with SMTP id HUB73912
        for <linux-mtd@lists.infradead.org>; Mon, 07 Apr 2003 12:28:39 -0700
Date: Mon, 7 Apr 2003 14:18:57 -0500
From: Earl Manning <EManning@PRISMIQ.com>
To: linux-mtd@lists.infradead.org
Message-Id: <20030407141857.3a11609c.EManning@PRISMIQ.com>
In-Reply-To: <001f01c2fd36$9c006c90$1200a8c0@JOHNB>
References: <001f01c2fd36$9c006c90$1200a8c0@JOHNB>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="Multipart_Mon__7_Apr_2003_14:18:57_-0500_082ebd60"
Subject: Re: Problems making jffs2 utils
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.

--Multipart_Mon__7_Apr_2003_14:18:57_-0500_082ebd60
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi John,

I have a similar system, embedded mips based, and here is the changed Makefile for the util directory that I used.  I hope this helps.

Earl Manning

On Mon, 7 Apr 2003 14:50:49 -0400
"John Burch" <jburch@vincisystems.com> wrote:

> I'm running into compiler errors when trying to build the jffs2
> utilities for a 2.4.17/mips target.  I've checked out the latest mtd
> code according to www.linux-mtd.infradead.org, then have followed the
> instructions in the mtd/util/README file (copied mtd/util contents to
> directory under linux root and changed $CROSS as necessary since I'm
> cross-compiling to mips).  I cd to <mips-kernel-path>/linux/utils and do
> a make, but get errors immediately, which typically include the
> following (depending on which util I'm trying to make)...
> 
> .../libc.so.6: undefined reference to 'no symbol'
> .../mips-linux-ld: cannot find -lz
> 
> I'm really only after 'erase' and maybe 'jffs2reader' for use on my mips
> embedded target; I already have mkfs.jffs2 as an x86 binary for my x86
> development platform.  Any ideas, or better place for me to post this
> question?
> 
> John
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

--Multipart_Mon__7_Apr_2003_14:18:57_-0500_082ebd60
Content-Type: application/octet-stream;
 name="Makefile"
Content-Disposition: attachment;
 filename="Makefile"
Content-Transfer-Encoding: base64

CiMgLSotIHNoIC0qLQoKIyAkSWQ6IE1ha2VmaWxlLHYgMS4xLjEuMSAyMDAzLzAzLzI2IDIwOjU4
OjI3IGVhcmwgRXhwICQKCkhPU1RDQyA6PSBnY2MKQ1JPU1M9bWlwc2VsLWxpbnV4LQpDQyA6PSAk
KENST1NTKWdjYwpIT1NUQ0ZMQUdTICs9IC1JLi4vaW5jbHVkZSAtTzIgLVdhbGwgLVdzdHJpY3Qt
cHJvdG90eXBlcyAtV3NoYWRvdwpDRkxBR1MgKz0gLUkuLi9pbmNsdWRlIC1XYWxsIC1Xc3RyaWN0
LXByb3RvdHlwZXMgLVdzaGFkb3cgLVdsLC1Cc3RhdGljCgpUQVJHRVRTID0gZnRsX2Zvcm1hdCBl
cmFzZSBlcmFzZWFsbCBuZnRsZHVtcCBuYW5kZHVtcCBkb2NfbG9hZGJpb3MgXApuZnRsX2Zvcm1h
dCBta2ZzLmpmZnMgZnRsX2NoZWNrIG1rZnMuamZmczIgbG9jayB1bmxvY2sgXAplaW5mbyBtdGRf
ZGVidWcgZmNwIG5hbmR3cml0ZSBqZmZzMmR1bXAgI2pmZnMycmVhZGVyCgpTWU1MSU5LUyA9IGNy
YzMyLmggY3JjMzIuYyBjb21wcl9ydGltZS5jCgphbGw6ICQoVEFSR0VUUykKCmNsZWFuOgoJcm0g
LWYgKi5vICQoVEFSR0VUUykgJChTWU1MSU5LUykKCm1rZnMuamZmczIubyBlcmFzZWFsbC5vIGNy
YzMyLm86IGNyYzMyLmgKCiQoU1lNTElOS1MpOgoJbG4gLXNmIC4uL2ZzL2pmZnMyLyRAICRACgoj
IG1rZnMuamZmczI6IGNyYzMyLm8gY29tcHJfcnRpbWUubyBta2ZzLmpmZnMyLm8gY29tcHJfemxp
Yi5vCiMgCSQoQ0MpICQoTERGTEFHUykgLW8gJEAgJF4gLWx6CgojIGVyYXNlYWxsOiBjcmMzMi5v
IGVyYXNlYWxsLm8KIyAJJChDQykgJChMRExBR1MpIC1vICRAICReIC1segoKIyBqZmZzMnJlYWRl
cjogamZmczJyZWFkZXIubwojIAkkKENDKSAkKExERkxBR1MpIC1vICRAICReIC1seiAKCm1rZnMu
amZmczI6IGNyYzMyLmMgY29tcHJfcnRpbWUuYyBta2ZzLmpmZnMyLmMgY29tcHJfemxpYi5jCgkk
KEhPU1RDQykgJChIT1NUQ0ZMQUdTKSAkKExERkxBR1MpIC1vICRAICReIC1segoKZXJhc2VhbGw6
IGNyYzMyLm8gZXJhc2VhbGwubwoJJChDQykgJChMRExBR1MpIC1vICRAICReCgpqZmZzMnJlYWRl
cjogamZmczJyZWFkZXIubwoJJChDQykgJChMREZMQUdTKSAtbyAkQCAkXgoKCg==

--Multipart_Mon__7_Apr_2003_14:18:57_-0500_082ebd60--
