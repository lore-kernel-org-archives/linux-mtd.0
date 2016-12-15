Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cHenO-0004vU-9X
 for linux-mtd@lists.infradead.org; Thu, 15 Dec 2016 22:46:40 +0000
Subject: Re: linux-next: Tree for Dec 15 (fs/ubifs/ causes problems in
 fs/crypto/)
To: Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
References: <20161215142108.0ec084b0@canb.auug.org.au>
 <a29553a3-c355-43ed-7d50-3aeb7eb8b3b1@infradead.org>
Cc: linux-kernel@vger.kernel.org, Artem Bityutskiy <dedekind1@gmail.com>,
 linux-mtd@lists.infradead.org, Eric Biggers <ebiggers@google.com>,
 Theodore Ts'o <tytso@mit.edu>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <ac59de6f-eaac-d088-a9d7-ce77e10f8a51@nod.at>
Date: Thu, 15 Dec 2016 23:46:02 +0100
MIME-Version: 1.0
In-Reply-To: <a29553a3-c355-43ed-7d50-3aeb7eb8b3b1@infradead.org>
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

Randy,

On 15.12.2016 19:13, Randy Dunlap wrote:
> On 12/14/16 19:21, Stephen Rothwell wrote:
>> Hi all,
>>
>> Please do not add any material for v4.11 to your linux-next included
>> branches until after v4.10-rc1 has been released.
>>
>> Changes since 20161214:
>>
> 
> on x86_64:
> 
> when CONFIG_BLOCK is not enabled:
> 
> warning: (UBIFS_FS_ENCRYPTION) selects FS_ENCRYPTION which has unmet direct dependencies (BLOCK)

UBIFS does not depend on CONFIG_BLOCK but fs/crypto/ does.
As short-term solution we can make UBIFS_FS_ENCRYPTION depend on CONFIG_BLOCK,
a better solution would be extracting all block specific stuff from fs/crypto/crypto.c
to another file.

Thanks,
//richard
