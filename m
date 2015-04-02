Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ydh3e-0002t8-Cz
 for linux-mtd@lists.infradead.org; Thu, 02 Apr 2015 15:29:27 +0000
Message-ID: <551D603D.90805@nod.at>
Date: Thu, 02 Apr 2015 17:29:01 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] mtd: Add simple read disturb test
References: <1427984026-31100-1-git-send-email-richard@nod.at>
 <CAOMZO5AeuCJB5anOt9Rq_H-HsLhXR9VZz0PDkN=R6aRPZN=+0g@mail.gmail.com>
In-Reply-To: <CAOMZO5AeuCJB5anOt9Rq_H-HsLhXR9VZz0PDkN=R6aRPZN=+0g@mail.gmail.com>
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

Am 02.04.2015 um 16:32 schrieb Fabio Estevam:
>> +
>> +                       ret = read_eraseblock_by_page(i, iteration);
>> +
>> +                       ret = mtdtest_relax();
>> +                       if (ret)
>> +                               goto out;

BTW: While all the nitpicking you oversaw the real issue in my code.
I do not check ret after read_eraseblock_by_page(). ;-\

Thanks,
//richard
