Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SaQKz-00085x-R5
 for linux-mtd@lists.infradead.org; Fri, 01 Jun 2012 11:48:14 +0000
Message-ID: <4FC8AC00.7020309@intel.com>
Date: Fri, 01 Jun 2012 14:48:16 +0300
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
In-Reply-To: <Pine.LNX.4.64.1206011133500.4247@lnxricardw.se.axis.com>
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

On 01/06/12 13:10, Ricard Wanderlof wrote:
> 
> On Mon, 28 May 2012, Adrian Hunter wrote:
> 
>> On 25/05/12 11:00, Ricard Wanderlof wrote:
>>>
>>> On Fri, 25 May 2012, Robert Homann wrote:
>>>
>>>> It is definitely a lot simpler to just set this parameter to some big
>>>> value and generate new images from scratch since the overhead in space
>>>> consumption is not an issue in this case. But let's say, in my case the
>>>> purpose of using such a resizing tool is not space optimization, but
>>>> fixing a former decision...
>>>
>>> I think this is a most important point. Whatever sizing strategy and volume
>>> sizes that are decided upon, one can be sure that a couple of years down the
>>> line differing circumstances will require a re-think of that strategy, no
>>> matter how well founded the decision was to start with.
>>
>> Unless you set max_leb_cnt to match the media size.
>>
>> The point is resizing when max_leb_cnt is not changed is much simpler.
> 
> One point I ran into though is that when specifying a larger max-leb-cnt
> than the size of the volume, by default the journal size also increases
> (it is according to Artem 12% of the max-leb-cnt
> (http://lists.infradead.org/pipermail/linux-mtd/2012-March/040084.html), but
> on my system it seems to be less than that and varies with the LEB count;
> see below - perhaps 12% is the maximum size?).
> 
> I've got a 128 MB flash with 128 kB blocks on my system, i.e. a LEB size of
> 129024 and a total LEB count for the whole device of 1024.
> 
> Say you have an ~8 MB volume on the flash = 65 LEBs, and you create a file
> system image for it with a max-leb-cnt of 65. This results in a default
> journal size of 903168 bytes according to mkfs.ubifs -v. (Incidentally, the
> journal size here appears to be about 11% of the total LEB count for the
> volume.)
> 
> If you now create a file system image with a max-leb-cnt of 1024, this
> results in a default journal size of 8388608 = 8M which is larger than the
> space available in the volume. (Incidentally, the journal size in this case
> appears to be about 6% of the total LEB count specified).

If you let mkfs.ubifs calculate the journal size it will limit it to 8MiB max.

> 
> Of course, the volume size could be set to, say, 16 MB instead, but
> neverthless, 8 MB of this 16 MB volume is then wasted for a journal intended
> to fit a (future) larger volume size.
> 
> So, just increasing max-leb-cnt causes a lot of wasted space in a small
> volume by default. Of course one could specify a smaller journal size, the
> question is then what journal size to set? Are there any guidelines which
> would be helpful in this case (Artem?) ?

The journal must be scanned after an unclean unmount (e.g. power loss)
so a small journal is better for that.  However once the journal is full it
must be committed which involves a certain amount of overhead so a bigger
journal is better for that, but at some point it makes hardly any difference.

You can use the flash read speed to get an idea of how big a journal you can
live with. e.g. in the worst case you want to mount in 3 seconds, your read
speed is 4MiB/s so you need a journal less than 12MiB (but reading the
journal is just one part of mounting so maybe 8MiB is better).

You can use the flash write speed to get an idea of how often a commit
happens.  e.g. flash write speed is 3MiB/s, journal is 4MiB, a commit begins
when the journal is 13/16 full, so there is a commit at most once per
second, which sounds OK.

> 
> /Ricard
