Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14aGJA-0008Me-00
	for mtd-list@infradead.org; Tue, 06 Mar 2001 12:11:16 +0000
From: Robert Kaiser <rob@sysgo.de>
Reply-To: rob@sysgo.de
To: David Woodhouse <dwmw2@infradead.org>
Subject: Using mtdblock as root device
Date: Tue, 6 Mar 2001 12:38:31 +0100
Content-Type: Multipart/Mixed;
  boundary="Boundary-=_nWlrBbmQBhCDarzOwKkYHIDdqSCD"
Cc: <mtd@infradead.org>
MIME-Version: 1.0
Message-Id: <01030613110600.01913@rob>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


--Boundary-=_nWlrBbmQBhCDarzOwKkYHIDdqSCD
Content-Type: text/plain
Content-Transfer-Encoding: 8bit

Hi,

I just tried to build a system that uses jffs on /dev/mtdblock0 as root fs.
This didn't work right away because the kernel did not honor the option
"root=/dev/mtdblock0" . This is because mtdblock devices are not listed
in the list of known root devices in the kernel (see "root_dev_names" in file
init/main.c). After applying the attached patch, using mtdblock as rootfs
worked nicely.

Now my question is: is there any particular reason (other than "nobody has
told Linus") why this is not already in the standard kernel ?

If there isn't, should I go ahead and submit my patch to Linus ?


Cheers

Rob


----------------------------------------------------------------
Robert Kaiser                         email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14                    phone: (49) 6136 9948-762
D-55270 Klein-Winternheim / Germany   fax:   (49) 6136 9948-10

--Boundary-=_nWlrBbmQBhCDarzOwKkYHIDdqSCD
Content-Type: text/plain;
  name="patch-mtdblock-root"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="patch-mtdblock-root"

LS0tIGxpbnV4L2luaXQvbWFpbi5jLm9yaWcJVGh1IEphbiAgNCAwNTo0NToyNiAyMDAxCisrKyBs
aW51eC9pbml0L21haW4uYwlUdWUgTWFyICA2IDEyOjU3OjAwIDIwMDEKQEAgLTI3Myw2ICsyNzMs
MjQgQEAKICNpZmRlZiBDT05GSUdfTkZUTAogCXsgIm5mdGxhIiwgMHg1ZDAwIH0sCiAjZW5kaWYK
KyNpZmRlZiBDT05GSUdfTVRECisJeyAibXRkYmxvY2swIiwgMHgxZjAwIH0sCisJeyAibXRkYmxv
Y2sxIiwgMHgxZjAxIH0sCisJeyAibXRkYmxvY2syIiwgMHgxZjAyIH0sCisJeyAibXRkYmxvY2sz
IiwgMHgxZjAzIH0sCisJeyAibXRkYmxvY2s0IiwgMHgxZjA0IH0sCisJeyAibXRkYmxvY2s1Iiwg
MHgxZjA1IH0sCisJeyAibXRkYmxvY2s2IiwgMHgxZjA2IH0sCisJeyAibXRkYmxvY2s3IiwgMHgx
ZjA3IH0sCisJeyAibXRkYmxvY2s4IiwgMHgxZjA4IH0sCisJeyAibXRkYmxvY2s5IiwgMHgxZjA5
IH0sCisJeyAibXRkYmxvY2sxMCIsIDB4MWYwYSB9LAorCXsgIm10ZGJsb2NrMTEiLCAweDFmMGIg
fSwKKwl7ICJtdGRibG9jazEyIiwgMHgxZjBjIH0sCisJeyAibXRkYmxvY2sxMyIsIDB4MWYwZCB9
LAorCXsgIm10ZGJsb2NrMTQiLCAweDFmMGUgfSwKKwl7ICJtdGRibG9jazE1IiwgMHgxZjBmIH0s
CisjZW5kaWYKIAl7IE5VTEwsIDAgfQogfTsKIAo=

--Boundary-=_nWlrBbmQBhCDarzOwKkYHIDdqSCD--


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
