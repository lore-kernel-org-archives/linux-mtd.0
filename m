Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ataRa-0000Et-NI
 for linux-mtd@lists.infradead.org; Fri, 22 Apr 2016 12:44:24 +0000
Subject: Re: Fwd: Encrypted NAND flash over UBI performance bench marking
To: benson_young@sercomm.com
References: <CABJ+KKvj4VDUvqTnj+dWf8+qzhK5hhvacdx551JbzmUQye4biA@mail.gmail.com>
 <5719E36A.3070601@nod.at>
 <CABJ+KKvaVX9HMtFYjOnOwW1xHxw5v9ecZs+SFdJYsCmtLNOKiw@mail.gmail.com>
 <OFC23048C2.C6508474-ON48257F9D.003136DE-48257F9D.00338EFE@sercomm.com>
Cc: Benson Young <benson6877@gmail.com>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
From: Richard Weinberger <richard@nod.at>
Message-ID: <571A1C88.505@nod.at>
Date: Fri, 22 Apr 2016 14:43:52 +0200
MIME-Version: 1.0
In-Reply-To: <OFC23048C2.C6508474-ON48257F9D.003136DE-48257F9D.00338EFE@sercomm.com>
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 22.04.2016 um 11:23 schrieb benson_young@sercomm.com:
> Hi Richard,
> 
> If my applications within the EXT4 rootfs do not write on a very regular basis, and setting noatimein
> mount option. will I still have NAND thrashing problem? i.e. the file system itself will try to
> update/journal/sync on a very regular basis (something like 30 second buffer flush)? As you can see
> my knowledge with EXT4 and most file systems are very limited.

You mean ext4 on top of a loopback file on UBIFS?
I don't think it will be a big problem. But to be sure do some tests. :-)
UBI exports ec counter stats in sysfs.

Thanks,
//richard
