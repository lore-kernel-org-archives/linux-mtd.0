Received: from anubis.se.axis.com ([195.60.68.12])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SaLUp-0000MA-I2
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 06:38:04 +0000
Received: from localhost (localhost [127.0.0.1])
 by anubis.se.axis.com (Postfix) with ESMTP id 015CE19E3B
 for <linux-mtd@lists.infradead.org>; Fri,  1 Jun 2012 08:37:56 +0200 (CEST)
Received: from anubis.se.axis.com ([127.0.0.1])
 by localhost (anubis.se.axis.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id n-W8Wc+uAziV for <linux-mtd@lists.infradead.org>;
 Fri,  1 Jun 2012 08:37:55 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
 by anubis.se.axis.com (Postfix) with ESMTP id 99C5419E3A
 for <linux-mtd@lists.infradead.org>; Fri,  1 Jun 2012 08:37:53 +0200 (CEST)
Received: from lnxricardw.se.axis.com (lnxricardw.se.axis.com [10.88.7.1])
 by thoth.se.axis.com (Postfix) with ESMTP id 8F07A3414A
 for <linux-mtd@lists.infradead.org>; Fri,  1 Jun 2012 08:37:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lnxricardw.se.axis.com (8.14.3/8.14.3/Debian-5+lenny1) with ESMTP id
 q516brWU013379
 for <linux-mtd@lists.infradead.org>; Fri, 1 Jun 2012 08:37:53 +0200
Date: Fri, 1 Jun 2012 08:37:53 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: mtd nand erase and bad block
In-Reply-To: <4FC8601C.5070708@intel.com>
Message-ID: <Pine.LNX.4.64.1206010837100.4247@lnxricardw.se.axis.com>
References: <4FC76039.6020701@sirius-es.it> <4FC771EC.4090500@intel.com>
 <4FC78012.5010704@sirius-es.it> <4FC8601C.5070708@intel.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 1 Jun 2012, Adrian Hunter wrote:

>> What's the way for recheck bad blocks and refresh the BBT from userspace
>> application?
>
> I always just temporarily hack the kernel driver to allow the erase of th=
e
> bad block in question.

I agree. Having that capability available at all times would be scary.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
