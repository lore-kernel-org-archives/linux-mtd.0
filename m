Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cMWsL-0002SU-Jh
 for linux-mtd@lists.infradead.org; Thu, 29 Dec 2016 09:19:54 +0000
Subject: Re: [PATCH 3/6] ubifs: Use 64bit readdir cookies
To: "J. Bruce Fields" <bfields@fieldses.org>
References: <1480629741-18375-1-git-send-email-richard@nod.at>
 <1480629741-18375-4-git-send-email-richard@nod.at>
 <20161229025835.GC21325@fieldses.org>
Cc: linux-mtd@lists.infradead.org, david@sigma-star.at, tytso@mit.edu,
 dedekind1@gmail.com, adrian.hunter@intel.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, adilger.kernel@dilger.ca,
 akpm@linux-foundation.org, linux-ext4@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <bf60916c-e0f2-387c-ce21-325ad8977539@nod.at>
Date: Thu, 29 Dec 2016 10:19:27 +0100
MIME-Version: 1.0
In-Reply-To: <20161229025835.GC21325@fieldses.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bruce,

On 29.12.2016 03:58, J. Bruce Fields wrote:
> On Thu, Dec 01, 2016 at 11:02:18PM +0100, Richard Weinberger wrote:
>> This is the first step to support proper telldir/seekdir()
>> in UBIFS.
>> Let's report 64bit cookies in readdir(). The cookie is a combination
>> of the entry key plus the double hash value.
> 
> Would it be possible to explain what that means in a little detail, for
> a ubifs-ignoramus?
> 
> I'm just curious how it meets the requirements for nfs exports.

Traditionally UBIFS had 32bit readdir() cookies, ctx->pos was a 32bit
integer.
This integer is the 32bit key out the UBIFS index tree.

In ->lookup(), UBIFS computes the r5 hash of the requested file name
which will be used as search key. Since the chance is high to face a hash
collision in the 32bit space, UBIFS also does a string compare
to find the correct directory entry for the given file name.

For NFS, and fscrypt, UBIFS has to offer a way to lookup a directory
entry by a given cookie without knowing the file name.
So, UBIFS has no chance to detect or handle a hash collision.

To deal with that UBIFS uses a similar trick as ext4 does, it stores
another unique identifier of the file name which can be used as cookie.
While ext4 stores two 32bit hash values, therefore the name double hash,
which will be combined to a single 64bit cookie, UBIFS stores additionally
a 32bit random number which will be generated upon directory entry creation.
Using the 32bit hash value and the 32bit nonce it can provide a 64bit
cookie.

Lookup via cookie works like a regular lookup but instead of comparing
strings it compares the nonce values.

That way UBIFS can provide a 64bit readdir() cookie which is required for NFS3.

Thanks,
//richard
