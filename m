Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cB7qB-0005aj-F3
 for linux-mtd@lists.infradead.org; Sun, 27 Nov 2016 22:22:32 +0000
Subject: Re: [PATCH 00/29] UBIFS File Encryption v1
To: Theodore Ts'o <tytso@mit.edu>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, jaegeuk@kernel.org,
 david@sigma-star.at, wd@denx.de, sbabic@denx.de, dengler@linutronix.de,
 ebiggers@google.com, mhalcrow@google.com, hch@infradead.org
References: <1479072072-6844-1-git-send-email-richard@nod.at>
 <20161114030548.eils5al7ugfhlqwg@thunk.org>
 <34885683-a40f-eaff-b99d-b11fc68803f7@nod.at>
 <20161127175241.ojvqnla4zn5mkg63@thunk.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <698c121c-5d44-1d6f-cab8-0cbaa61e5109@nod.at>
Date: Sun, 27 Nov 2016 23:21:56 +0100
MIME-Version: 1.0
In-Reply-To: <20161127175241.ojvqnla4zn5mkg63@thunk.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ted,

On 27.11.2016 18:52, Theodore Ts'o wrote:
> On Fri, Nov 25, 2016 at 09:18:12AM +0100, Richard Weinberger wrote:
>>
>> Do you want us to address Eric's review comments on top of the fscrypt
>> branch or shall we rebase?
>> I'd suggest the former.
> 
> Yes, let's address them on top of the existing fscrypt branch.  I
> don't consider any of his comments super-serious --- they were mostly
> documentation or comments level changes unless I missed something.

Okay. Then I'll queue UBIFS encryption for the v4.10 merge window.
Just to be sure, I base my UBIFS next tree on your fscrypt tree such that
it will build fine and Linus won't see same commits with a different sha1?
Usually I'm a lucky maintainer and not have to deal with dependencies
between pull requests. :-)

Thanks,
//richard
