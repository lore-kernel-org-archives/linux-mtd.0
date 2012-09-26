Received: from anubis.se.axis.com ([195.60.68.12])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TGpUm-0005ef-Ix
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2012 11:09:37 +0000
Date: Wed, 26 Sep 2012 13:09:29 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: MONDON Daniel <Daniel.MONDON@lpgsystems.com>
Subject: Re: ubinize.cfg for NAND with multi ubi devices and multi volume
 inside
In-Reply-To: <D604D5FB4D200642AA2FAAE94E39258601AFFFCE@CARAMBAR.lpg.priv>
Message-ID: <alpine.DEB.2.00.1209261307230.19047@lnxricardw.se.axis.com>
References: <D604D5FB4D200642AA2FAAE94E39258601AFFFCE@CARAMBAR.lpg.priv>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"; format=flowed
Content-Transfer-Encoding: 8BIT
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 26 Sep 2012, MONDON Daniel wrote:

> I don't find how to generate my .cfg for the ubinize command.
> Perhaps impossible ?
>
> I'v got 1GB NAND with 4 UBI devices.
> I want to ubinize some volumes in some UBI devices.
>
> For example : (i've got ubi1_0 to ubi1_3 and ubi4_0 to ubi4_4)
> Ubi1_0 (80MiB)
> Ubi1_3 (300MiB)
> Ubi4_0 (30MiB)
> Ubi4_4 (30MiB)
>
> What have i to write in the .cfg file.
>
> With the result, i will use ubiupdatevol to write fs images.

Ubinize is not intended for use by ubiupdatevol, rather it is intended 
when you need an image to write to raw flash, for instance during 
production. With ubiupdatevol you simply supply the volume images that you 
get from mkfs.ubifs (or the binary blobs if that's what you want to store 
there).

Or do you mean that you already have data in your volumes, and you want to 
create a file system image which you can then write to another device 
using ubiupdatevol? In that case you would use mkfs.ubifs to create a file 
system image from the file system.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
