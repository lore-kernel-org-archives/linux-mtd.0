Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctKnl-0008Td-R8
 for linux-mtd@lists.infradead.org; Wed, 29 Mar 2017 21:06:48 +0000
Subject: Re: [REGRESSION 4.11] Commit d8514d8edb5b ("ovl: copy up regular file
 using O_TMPFILE") breaks ubifs
To: Amir Goldstein <amir73il@gmail.com>,
 Ralph Sennhauser <ralph.sennhauser@gmail.com>
References: <20170328100107.25095af6@gmail.com>
 <CAOQ4uxisw5vWYsdMTNemw=MqNyS2nxfAUkg+UfoGmbE3-he1Ug@mail.gmail.com>
 <CAOQ4uxgpFBFEk9h9eowQmeaC60xTFno0RsvA7MhkN9a=AeHhCg@mail.gmail.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, linux-unionfs@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 regressions@leemhuis.info, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 David Oberhollenzer <goliath@sigma-star.at>
From: Richard Weinberger <richard@nod.at>
Message-ID: <79fe8302-0b16-3596-bfce-4aa02d4c48a4@nod.at>
Date: Wed, 29 Mar 2017 23:06:20 +0200
MIME-Version: 1.0
In-Reply-To: <CAOQ4uxgpFBFEk9h9eowQmeaC60xTFno0RsvA7MhkN9a=AeHhCg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Amir,

Am 28.03.2017 um 12:43 schrieb Amir Goldstein:
> On Tue, Mar 28, 2017 at 5:27 AM, Amir Goldstein <amir73il@gmail.com> wrote:
>> On Tue, Mar 28, 2017 at 4:01 AM, Ralph Sennhauser
>> <ralph.sennhauser@gmail.com> wrote:
>>> Hi Amir
>>>
>>> Commit d8514d8edb5b ("ovl: copy up regular file using O_TMPFILE")
>>> breaks squashfs with an ubifs overlay (both ubi volumes of the same
>>> container).
>>>
>>
>> Hi Ralph,
>>
>> I am confused by the description above. Which are the 'both ubi volumes'?
>>
>> Can you provide exact command of overlayfs mount, preferably
>> also a script to generate the lower/upper images and mount them
>> to remove any mkfs option doubts from test setup.
>>
>>> Renaming a file results in an error "UBIFS error (ubi0:1 pid 1394):
>>> ubifs_add_orphan: orphaned twice". This corrupts the the filesystem and
>>> the next attempt to mount the overlay will fail.
>>>
> 
> Looking at the ubifs code, it does not appear that ubifs_link() ever calls
> ubifs_delete_orphan() for the case of linking a temp file (nlink == 0),
> so this looks like a ubifs bug.

Thanks for the heads up, I'll look into this.

> Is ubifs being tested with xfstests? This should have been caught by test
> generic/004 (link tempfile then delete it).

Yes, it is.
David, can you please double-check wrt. test generic/004?

Thanks,
//richard
