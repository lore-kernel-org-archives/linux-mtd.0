Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XTv2F-0006Pf-J9
 for linux-mtd@lists.infradead.org; Tue, 16 Sep 2014 15:51:20 +0000
Message-ID: <54185C5F.1050609@nod.at>
Date: Tue, 16 Sep 2014 17:50:55 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: xfstests on UBIFS - first findings
References: <5416ADB8.80301@nod.at>
 <1410882292.28850.60.camel@sauron.fi.intel.com>
In-Reply-To: <1410882292.28850.60.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 16.09.2014 17:44, schrieb Artem Bityutskiy:
> On Mon, 2014-09-15 at 11:13 +0200, Richard Weinberger wrote:
>> One can simple trigger it by doing:
>> # mknod foo c 0 0
>> # setfattr -h -n trusted.name foo
>>
>> dir_ui->data_len is 4 instead of 0.
> 
> I think the assertion is bogus. It was correct before the xattr support
> was added.
> 
> The assertion basically is: if the inode is a directory inode, it should
> not have data in it.
> 
> In that function, dir_ui (directory UBIFS inode) may be also be the
> "host" inode for the xattr entry, so it is not necessarily a directory
> inode at all.
> 
> So the variable should be re-named to "host_ui" instead of "dir_ui".

Thanks for the explanation.
I'll prepare a patch for that and give more testing tomorrow!

Thanks,
//richard
