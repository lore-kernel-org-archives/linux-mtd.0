Received: from anubis.se.axis.com ([195.60.68.12])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rv26D-00014U-Pu
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2012 07:37:58 +0000
Date: Wed, 8 Feb 2012 08:37:48 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Wei Wang <wangw8210@gmail.com>
Subject: Re: How to measure the mounting time in Linux
In-Reply-To: <CAF-d49SkoO33Wno2MoX+52uLb1VAgMKA0XAoJQS3GxA=USTtEw@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1202080837040.17234@lnxricardw.se.axis.com>
References: <CAF-d49SkoO33Wno2MoX+52uLb1VAgMKA0XAoJQS3GxA=USTtEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 7 Feb 2012, Wei Wang wrote:

> Hi All,
>
> Is there anyone know how to measure the mounting time in Linux? I have
> searched on google, but cannot find anything about it.

Do you mean the length of time a device has been mounted, or how long the=
=20
actual mounting process takes? In the latter case, one could simply do

# time mount <options>

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
