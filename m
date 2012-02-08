Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Rv23o-0005NM-7S
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2012 07:35:25 +0000
Date: Wed, 8 Feb 2012 08:35:21 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: Re: Userspace write to UBI partitions
In-Reply-To: <20120207190938.7a59fae9@pixies.home.jungo.com>
Message-ID: <Pine.LNX.4.64.1202080834220.17234@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1202071616560.17234@lnxricardw.se.axis.com>
 <20120207182944.334b4665@pixies.home.jungo.com>
 <Pine.LNX.4.64.1202071733580.17234@lnxricardw.se.axis.com>
 <20120207190938.7a59fae9@pixies.home.jungo.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 7 Feb 2012, Shmulik Ladkani wrote:

>> I'll try this out. In the meantime, there doesn't seem to be an ioctl fo=
r
>> erasing blocks?
>>
> Well, another option would be using Gluebi - (CONFIG_MTD_UBI_GLUEBI).
> It exposes a "regular" mtd for every existing volume.
>
> You'd be able to work using standard mtd interfaces on it (mtdchar
> ioctls, e.g. MEMERASE, or even the mtdblock abstraction).

For other reasons, gluebi is not a viable alternative for us. Mainly=20
because it puts an mtd device on _every_ ubi volume, meaning that volumes=
=20
can't be removed or resized while gluebi is enabled.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
