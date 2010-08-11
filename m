Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OjFLr-0005mq-SK
	for linux-mtd@lists.infradead.org; Wed, 11 Aug 2010 17:44:33 +0000
Received: by vws11 with SMTP id 11so281904vws.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Aug 2010 10:44:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <-1845909207770903949@unknownmsgid>
References: <893387.4342.qm@web180301.mail.gq1.yahoo.com>
	<AANLkTi=RqZjXojM0XD0RhYj23fY+zrunFRtFTYGd3POp@mail.gmail.com>
	<-1845909207770903949@unknownmsgid>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Wed, 11 Aug 2010 13:27:36 -0400
Message-ID: <AANLkTimQOPe3MvxKtQ8q1Wf3+EsOf+NY7Vr8R5SG+uqU@mail.gmail.com>
Subject: Re: [PATCH] m25p80: add support for a callback to platform code on
	successful device probe
To: Sudhakar Rajashekhara <sudhakar.raj@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: David Brownell <david-b@pacbell.net>, linux-mtd@lists.infradead.org,
	davinci-linux-open-source@linux.davincidsp.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 11, 2010 at 07:56, Sudhakar Rajashekhara wrote:
> On Wed, Aug 11, 2010 at 00:32:00, Mike Frysinger wrote:
>> On Tue, Aug 10, 2010 at 09:07, David Brownell wrote:
>> >> On Tue, Aug 10, 2010 at 12:47:05, Mike Frysinger wrote:
>> >> it is necessary
>> >> > that you do these things from kernel space instead of
>> >> standard
>> >> > userspace.
>> >
>> > Hard to get userspace to do this stuff if
>> > you're doing a network boot, and thus need
>> > to have the MAC address working early.. it's
>> > easy if the kernel can get the MAC address,
>> > else not possible to boot. =C2=A0Right?
>>
>> no, that isnt true at all. =C2=A0you can easily have a small initramfs t=
o
>> handle all of your random setup. =C2=A0if that's too much overhead, you =
can
>> add a late initcall to your boards file that is run after the MTD
>> devices are probed and let that read the required information. =C2=A0all=
 of
>> this is more than documented:
>> http://www.denx.de/wiki/view/DULG/EthernetDoesNotWorkInLinux
>
> I looked around in the kernel and found mtd_notifier callbacks which get
> called upon addition of MTD device. Inside this callback, I am checking
> for the device in which I am interested and doing a mtd->read to get the
> MAC address. So this patch can be dropped.

thanks for the follow up explanation
-mike
