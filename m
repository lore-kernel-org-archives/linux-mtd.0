Received: from mika.eatserver.nl ([2001:67c:28fc:195:20:9:75:0])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Us8Zh-0003KP-3S
 for linux-mtd@lists.infradead.org; Thu, 27 Jun 2013 09:33:10 +0000
Message-ID: <51CC0692.6010507@aimvalley.nl>
Date: Thu, 27 Jun 2013 11:32:02 +0200
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
To: enrico benetti <enrico.benetti@bluewind.it>
Subject: Re: UBIFS: power cut test on 2.6.35 + NOR
References: <51CBDF47.709@bluewind.it>
In-Reply-To: <51CBDF47.709@bluewind.it>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/27/13 08:44, enrico benetti wrote:
> Hi All,
> I'd need a hint on the best way to go on with my development.
>
> I'm working on a custom target based on 2.6.35.3 kernel with NOR device.
>
> UBIFS R/W partitions seem not robust against power cut tests: I'm using
> integck 1.4.9 and I can have unrecoverable errors on tested volume when
> performing real power cuts.
>
> First of all, I've done several MTD stress tests to validate the low
> level driver.
> I've checked git repos, and
> http://git.infradead.org/users/dedekind/ubifs-v2.6.35.git/ <http://git.infradead.org/users/dedekind/ubifs-v2.6.35.git/shortlog>
> is updated to 08/2012 (that is approx 3.7.1 kernel revision) and no more
> supported.
>
>  From several discussions on the list I think the best way to solve (or
> at least to have a better behaviour with ubi/ubifs) could be to get the
> patches from this repo and merge them with my sources.
>
> Do you agree or is it better to do more investigation on current issues?
>
> Thanks in advance for your support,
> Enrico
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>

yes, use http://git.infradead.org/users/dedekind/ubifs-v2.6.35.git to update.

it has several "NOR power cut" fixes, for example:

http://git.infradead.org/users/dedekind/ubifs-v2.6.35.git/commit/152780c61d65b0cc5cd5cc974e926a9c47534d5e
http://git.infradead.org/users/dedekind/ubifs-v2.6.35.git/commit/9258edaca1d7b36abd0e23661579c35fe9c4f00f
http://git.infradead.org/users/dedekind/ubifs-v2.6.35.git/commit/e5d7669e2fa0797c0c110fa9bf3e51b013ba399b

which I doubt are in 2.6.35.3

Btw. we used the (no longer available) http://git.infradead.org/users/dedekind/ubifs-v2.6.29.git
(that has been kept up-to-date with mainline till June 2011) to update our sources, and we see
no NOR power cut issues.

---
N. van Bolhuis.
