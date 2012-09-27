Received: from mailbackup.lpgfinance.com ([46.18.228.1] helo=antispam.lpg.priv)
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TH8Cn-0007Bh-Pn
 for linux-mtd@lists.infradead.org; Thu, 27 Sep 2012 07:08:19 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: ubinize.cfg for NAND with multi ubi devices and multi volume
 inside
Date: Thu, 27 Sep 2012 09:08:12 +0200
Message-ID: <D604D5FB4D200642AA2FAAE94E39258601B000FD@CARAMBAR.lpg.priv>
In-Reply-To: <alpine.DEB.2.00.1209261307230.19047@lnxricardw.se.axis.com>
References: <D604D5FB4D200642AA2FAAE94E39258601AFFFCE@CARAMBAR.lpg.priv>
 <alpine.DEB.2.00.1209261307230.19047@lnxricardw.se.axis.com>
From: "MONDON Daniel" <Daniel.MONDON@lpgsystems.com>
To: <linux-mtd@lists.infradead.org>
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>On Wed, 26 Sep 2012, MONDON Daniel wrote:
>
>> I don't find how to generate my .cfg for the ubinize command.
>> Perhaps impossible ?
>>
>> I'v got 1GB NAND with 4 UBI devices.
>> I want to ubinize some volumes in some UBI devices.
>>
>> For example : (i've got ubi1_0 to ubi1_3 and ubi4_0 to ubi4_4)
>> Ubi1_0 (80MiB)
>> Ubi1_3 (300MiB)
>> Ubi4_0 (30MiB)
>> Ubi4_4 (30MiB)
>>
>> What have i to write in the .cfg file.
>>
>> With the result, i will use ubiupdatevol to write fs images.
>
>Ubinize is not intended for use by ubiupdatevol, rather it is intended =
when you need an image to write to raw flash, for >instance during =
production. With ubiupdatevol you simply supply the volume images that =
you get from mkfs.ubifs (or the binary >blobs if that's what you want to =
store there).
>
>Or do you mean that you already have data in your volumes, and you want =
to create a file system image which you can then >write to another =
device using ubiupdatevol? In that case you would use mkfs.ubifs to =
create a file system image from the file >system.

Yes.=20
I want to take volumes data and create file system image to update =
another device.
I will have a look to mkfs.ubifs!
:)


>/Ricard
>--=20
>Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
>Axis Communications AB, Lund, Sweden            www.axis.com
>Phone +46 46 272 2016                           Fax +46 46 13 61 30
