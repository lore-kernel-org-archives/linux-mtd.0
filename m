Received: from mail-lb0-f174.google.com ([209.85.217.174])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XTuk2-0006Ns-E8
 for linux-mtd@lists.infradead.org; Tue, 16 Sep 2014 15:32:31 +0000
Received: by mail-lb0-f174.google.com with SMTP id 10so22518lbg.5
 for <linux-mtd@lists.infradead.org>; Tue, 16 Sep 2014 08:32:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1410880524.28850.49.camel@sauron.fi.intel.com>
References: <1409348550-27768-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1409348550-27768-3-git-send-email-ezequiel.garcia@free-electrons.com>
 <1410173657.10764.148.camel@sauron.fi.intel.com>
 <20140908111832.GA1676@arch.hh.imgtec.org>
 <1410180460.10764.163.camel@sauron.fi.intel.com>
 <20140908182750.GA9222@arch.hh.imgtec.org>
 <1410880524.28850.49.camel@sauron.fi.intel.com>
Date: Tue, 16 Sep 2014 16:32:05 +0100
Message-ID: <CAAEAJfDnXe2Yb5OeVb07vsofrdDCV-h0umpYF-mukG+FyNP4LQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] UBI: block: Add support for the UBI_VOLUME_UPDATED
 notification
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: =?UTF-8?Q?Guido_Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 16 September 2014 16:15, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Mon, 2014-09-08 at 15:27 -0300, Ezequiel Garcia wrote:
>> On 08 Sep 03:47 PM, Artem Bityutskiy wrote:
>> > On Mon, 2014-09-08 at 08:18 -0300, Ezequiel Garcia wrote:
>> > > Regarding -stable, I think it's worth to pull the whole series.
>> >
>> > I've checked and the patches do not apply to 3.16 with many conflicts.
>> > Are you enthusiastic enough to try this and fined out the missing
>> > dependencies?
>> >
>> > The we could add the "Cc: stable@vger.kernel.org # v3.16+" tags, and
>> > also mentioned the commits we depend on in the commit messages.
>> >
>> > At this point I pushed your patches to the master branch. If you are
>> > going to check the stable story, please, use this branch.
>> >
>>
>> Sure, I'll prepare the list of commits and let you know.
>
> Should I wait some more or assume we won't add the stable tags and add
> these patches to the 'next' branch? It is about time, I guess.
>

Yeah, I have the list of commits ready a couple weeks ago:

4fda380 UBI: Dispatch update notification if the volume is updated
46a5b80 UBI: block: Add support for the UBI_VOLUME_UPDATED notification
db95429 UBI: block: Fix block device size setting
3170403 UBI: block: Avoid disk size integer overflow
b6c7b28 UBI: block: Set disk_capacity out of the mutex
1860e37 Linux 3.15

I just got delayed thinking if it was OK to pick so many commits into
stable. As an alternative,
we can mark only the ones on this patchset, namely:

4fda380 UBI: Dispatch update notification if the volume is updated
46a5b80 UBI: block: Add support for the UBI_VOLUME_UPDATED notification
db95429 UBI: block: Fix block device size setting

And I can provide a backport when the -stable people ask for one. Of
course, it's a bit more work
on everyone, so... what do you think?
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
