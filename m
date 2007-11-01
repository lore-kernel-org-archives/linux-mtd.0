Received: from mail.shareable.org ([81.29.64.88])
	by bombadil.infradead.org with esmtps (Exim 4.66 #1 (Red Hat Linux))
	id 1InOEc-0002Cv-5Y
	for linux-mtd@lists.infradead.org; Wed, 31 Oct 2007 20:48:40 -0400
Date: Thu, 1 Nov 2007 00:47:21 +0000
From: Jamie Lokier <jamie@shareable.org>
To: "Johnson, Charles F" <charles.f.johnson@intel.com>
Subject: Re: UBI Used In Commercial Products ??
Message-ID: <20071101004721.GA21550@mail.shareable.org>
References: <B1EDF20A6EAAD74EA65E46F774F1784502C6D577@orsmsx413.amr.corp.intel.com>
	<loom.20071031T215155-403@post.gmane.org>
	<B1EDF20A6EAAD74EA65E46F774F1784502C6D843@orsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <B1EDF20A6EAAD74EA65E46F774F1784502C6D843@orsmsx413.amr.corp.intel.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Johnson, Charles F wrote:
> One thought here is that I would think that mounting is a fairly rare
> occurance.  You're much more likely to coming back from suspend.

No, that only applies to portable devices like your iPAQ :-)

Sergei Sharonov wrote:
>> 4. Does not have internal battery or super-capacitor [...]

But even in some devices with batteries, mount time is a problem.  I
turn my phone off every night.  I don't want to receive any calls, and
I do want to conserve the battery charge.

It doesn't suspend, it powers off(*), and needs to remount everything
after booting in the morning.  The 20 seconds to boot the phone is
annoying, but acceptable.  Longer would be very annoying.

(*) I suspect suspend-to-RAM would be a problem with phones, because
(like my laptop), a suspended device consumes its battery charge much
more quickly than a device completely powered off.  Unless you suspend
to flash, that is :-)  Sometimes a phone is turned off to conserve
battery charge, so it really needs to do that.

-- Jamie
