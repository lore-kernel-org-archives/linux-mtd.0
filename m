Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxbTW-0002LU-Hh
 for linux-mtd@lists.infradead.org; Fri, 21 Oct 2016 15:11:16 +0000
Subject: Re: [PATCH 02/26] fscrypto: Constify struct inode pointer
To: Theodore Ts'o <tytso@mit.edu>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dedekind1@gmail.com, adrian.hunter@intel.com, jaegeuk@kernel.org,
 david@sigma-star.at, wd@denx.de, sbabic@denx.de, dengler@linutronix.de
References: <1477054121-10198-1-git-send-email-richard@nod.at>
 <1477054121-10198-3-git-send-email-richard@nod.at>
 <20161021145720.raaeyivtonf2ynmb@thunk.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <99679ee6-ccda-0c58-3278-14fb8cb8534c@nod.at>
Date: Fri, 21 Oct 2016 17:10:48 +0200
MIME-Version: 1.0
In-Reply-To: <20161021145720.raaeyivtonf2ynmb@thunk.org>
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

On 21.10.2016 16:57, Theodore Ts'o wrote:
> On Fri, Oct 21, 2016 at 02:48:17PM +0200, Richard Weinberger wrote:
>> Some filesystems, such as UBIFS, maintain a const pointer
>> for struct inode.
>>
>>  /* fname.c */
>> -extern int fscrypt_setup_filename(struct inode *, const struct qstr *,
>> -				int lookup, struct fscrypt_name *);
>> +extern int fscrypt_setup_filename(struct inode *dir, const struct qstr *iname,
>> +			   int lookup, struct fscrypt_name *fname);
> 
> Was it deliberate that you didn't add a const pointer here?

Erm, no. Either I forgot or while rebasing my mess to something
sane the change got lost.

> I take it that ubifs is basically using const in certain places to
> essentially promise that those functions don't actually modify the
> inode structure?

Yes.

Thanks,
//richard
