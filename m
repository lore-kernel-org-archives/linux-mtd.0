Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SWvQp-0004H5-Nl
 for linux-mtd@lists.infradead.org; Tue, 22 May 2012 20:11:49 +0000
MIME-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit
Date: Tue, 22 May 2012 22:11:43 +0200
From: Richard Weinberger <richard@nod.at>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Subject: Re: [PATCH] [RFC] UBI: Implement Fastmap support
In-Reply-To: <20120522211809.53bd6444@halley>
References: <1337608916-49771-1-git-send-email-richard@nod.at>
 <1337608916-49771-2-git-send-email-richard@nod.at>
 <20120522180119.2c2a10a8@pixies.home.jungo.com> <4FBBC4EE.4040802@nod.at>
 <20120522211809.53bd6444@halley>
Message-ID: <b3d5919d0b35bb559b7dc115bc9e2720@radon2.swed.at>
Cc: dedekind1@gmail.com, linux-kernel@vger.kernel.org,
 Heinz.Egger@linutronix.de, linux-mtd@lists.infradead.org, tim.bird@am.sony.com,
 tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 22 May 2012 21:18:09 +0300, Shmulik Ladkani
<shmulik.ladkani@gmail.com> wrote:
> Hi Richard,
> 
> On Tue, 22 May 2012 18:55:10 +0200 Richard Weinberger <richard@nod.at> wrote:
>> >> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
>> >> index 2c5ed5c..ef5d7b7 100644
>> >> --- a/drivers/mtd/ubi/build.c
>> >> +++ b/drivers/mtd/ubi/build.c
>> >> @@ -144,6 +144,16 @@ int ubi_volume_notify(struct ubi_device *ubi, struct ubi_volume *vol, int ntype)
>> >>
>> >>   	ubi_do_get_device_info(ubi,&nt.di);
>> >>   	ubi_do_get_volume_info(ubi, vol,&nt.vi);
>> >> +
>> >> +	switch (ntype) {
>> >> +	case UBI_VOLUME_ADDED:
>> >> +	case UBI_VOLUME_REMOVED:
>> >> +	case UBI_VOLUME_RESIZED:
>> >> +	case UBI_VOLUME_RENAMED:
>> >> +		if (ubi_update_fastmap(ubi))
>> >> +			ubi_err("Unable to update fastmap!");
>> >
>> > In the error case, what are the consequences leaving the older on-flash
>> > fastmap? Shouldn't it be invalidated?
>>

After thinking a bit more about this case I think the best we can to is
switching to read-only mode if ubi_update_fastmap()
fails.

Thanks,
//richard
