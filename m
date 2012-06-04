Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SbSB1-0006np-VE
 for linux-mtd@lists.infradead.org; Mon, 04 Jun 2012 07:58:12 +0000
Message-ID: <4FCC6A9D.4010208@intel.com>
Date: Mon, 04 Jun 2012 10:58:21 +0300
From: Adrian Hunter <adrian.hunter@intel.com>
MIME-Version: 1.0
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: Resizing of an existing UBIFS
References: <4FBB3506.3020904@bury.com>
 <1337669583.2483.88.camel@sauron.fi.intel.com> <4FBB3E7F.3080807@bury.com>
 <4FBF2DF7.8030809@intel.com> <4FBF396D.4070000@bury.com>
 <Pine.LNX.4.64.1205250958290.4247@lnxricardw.se.axis.com>
 <4FC340D4.9020905@intel.com>
 <Pine.LNX.4.64.1206011133500.4247@lnxricardw.se.axis.com>
 <4FC8AC00.7020309@intel.com>
 <Pine.LNX.4.64.1206012135000.20240@lnxricardw.se.axis.com>
In-Reply-To: <Pine.LNX.4.64.1206012135000.20240@lnxricardw.se.axis.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Robert Homann <homann@bury.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/06/12 22:47, Ricard Wanderlof wrote:
> 
> On Fri, 1 Jun 2012, Adrian Hunter wrote:
> 
>> If you let mkfs.ubifs calculate the journal size it will limit it to 8MiB
>> max.
> 
> Thanks, that explains the figures then.
> 
>> The journal must be scanned after an unclean unmount (e.g. power loss)
>> so a small journal is better for that.  However once the journal is full it
>> must be committed which involves a certain amount of overhead so a bigger
>> journal is better for that, but at some point it makes hardly any difference.
>>
>> You can use the flash read speed to get an idea of how big a journal you can
>> live with. e.g. in the worst case you want to mount in 3 seconds, your read
>> speed is 4MiB/s so you need a journal less than 12MiB (but reading the
>> journal is just one part of mounting so maybe 8MiB is better).
> 
> So what you're saying is that basically it's the worst-case mount time that
> together with the read speed sets the maximum journal size?

Generally yes.

>                                                              I assume if the
> unmount was clean there is no need to read the journal, or does it need to
> be scanned anyway? What if there was an unclean unmount but no data recently
> written so nothing in the journal, does it still have to be scanned in full?

Mounting after a clean unmount is always quicker because the journal is empty.

> 
>> You can use the flash write speed to get an idea of how often a commit
>> happens.  e.g. flash write speed is 3MiB/s, journal is 4MiB, a commit begins
>> when the journal is 13/16 full, so there is a commit at most once per
>> second, which sounds OK.
> 
> In my case there's not a lot of writes (much less than the flash write speed
> would make possible), so even a small journal would probably be ok. Even if
> there were the odd burst of writes we could live with a temporary surge in
> flash writes.
> 
> One question here: when one mounts an empty volume, it seems the ubifs
> creates a journal with some default value (which doesn't seem to be
> identical to the defaults that mkfs.ubifs uses). Is there any way to adjust
> those defaults, either with mount command options or with the sysfs?
> 
> What I'm getting at in a more concrete sense, is that if I create an empty 8
> MB UBI volume, then mount it as a ubifs file system (rather than
> mkfs.ubifs'ing an empty directory, setting appropriate parameters on the
> mkfs.ubifs command line, and ubiupdatevol'ing that), can I specify a maximum
> LEB count (and fix the journal size) that would be appropriate also for a
> future larger volume size?

No sorry.  UBIFS auto-formatting (aka default file system creation) takes no
parameters.  Maximum LEB count is simply set to the actual LEB count.
