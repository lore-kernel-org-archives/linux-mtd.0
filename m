Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cJ45x-0003FK-Uf
 for linux-mtd@lists.infradead.org; Mon, 19 Dec 2016 19:59:38 +0000
Subject: Re: [PATCH] ubifs: remove redundant checks for encryption key
To: Eric Biggers <ebiggers3@gmail.com>, linux-mtd@lists.infradead.org
References: <1482174948-104602-1-git-send-email-ebiggers3@gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-fsdevel@vger.kernel.org,
 Eric Biggers <ebiggers@google.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <1fb1f6a6-1204-5013-6406-7305861fdc5b@nod.at>
Date: Mon, 19 Dec 2016 20:59:15 +0100
MIME-Version: 1.0
In-Reply-To: <1482174948-104602-1-git-send-email-ebiggers3@gmail.com>
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

On 19.12.2016 20:15, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> In several places, ubifs checked for an encryption key before creating a
> file in an encrypted directory.  This was redundant with
> fscrypt_setup_filename() or ubifs_new_inode(), and in the case of
> ubifs_link() it broke linking to special files.  So remove the extra
> checks.

Thanks for doing this. I assume same or similar changes were also needed
for f2fs and ext4 since I've duplicated the logic from them? :-)

Thanks,
//richard
