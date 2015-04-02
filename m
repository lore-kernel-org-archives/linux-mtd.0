Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YdgtS-0005D7-MS
 for linux-mtd@lists.infradead.org; Thu, 02 Apr 2015 15:18:55 +0000
Message-ID: <551D5DC2.4090209@nod.at>
Date: Thu, 02 Apr 2015 17:18:26 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] mtd: Add simple read disturb test
References: <1427984026-31100-1-git-send-email-richard@nod.at>
 <CAOMZO5A8im4c126wZyD8tv1B0-2mvsgh5bfZ1mJWyMhG0fNM_Q@mail.gmail.com>
In-Reply-To: <CAOMZO5A8im4c126wZyD8tv1B0-2mvsgh5bfZ1mJWyMhG0fNM_Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 02.04.2015 um 17:02 schrieb Fabio Estevam:
> On Thu, Apr 2, 2015 at 11:13 AM, Richard Weinberger <richard@nod.at> wrote:
> 
>> +               ret = mtdtest_erase_eraseblock(mtd, i);
>> +               if (ret) {
>> +                       err = ret;
>> +                       goto out;
>> +               }
> 
> Why not just do like this instead?
> 
>               err = mtdtest_erase_eraseblock(mtd, i);
>               if (err)
>                  goto out;
> 
>> +
>> +               ret = mtdtest_write(mtd, i * mtd->erasesize, mtd->erasesize,
>> +                                   iobuf_orig);
>> +               if (ret) {
>> +                       err = ret;
>> +                       goto out;
>> +               }
> 
> Same here.

The real question is why did I use ret and err at all? ;)
This test is based on existing tests, thus it got copy&pasted.
I'll think about merging these two variables.
Thank for pointing this out.


>> +               ret = mtdtest_relax();
>> +               if (ret)
>> +                       goto out;
> 
> Here you propagate the wrong error. You test for 'ret' and propagate 'err'.

This is by design. I don't want to print an error message if the test is aborted.
mtdtest_relax() checks for that.

Thanks,
//richard
