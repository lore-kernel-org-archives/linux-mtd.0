Received: from blood.actrix.co.nz ([203.96.16.163])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EhEJv-0000wW-5C
	for linux-mtd@lists.infradead.org; Tue, 29 Nov 2005 17:51:39 -0500
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Date: Wed, 30 Nov 2005 11:12:14 +1300
References: <20051129180204.2f79e2ae.vwool@ru.mvista.com>
In-Reply-To: <20051129180204.2f79e2ae.vwool@ru.mvista.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200511301112.14512.manningc2@actrix.gen.nz>
Cc: Vitaly Wool <vwool@ru.mvista.com>
Subject: Re: [PATCH] treat OOB as a single chunk of oobavail bytes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 30 November 2005 04:02, Vitaly Wool wrote:
> Hi,
>
> the patch below implements treating the OOB data as a chunk of _free_ OOB
> bytes of mtd->oobavail size. This is what was announced several times. This
> patch is a working one (verified with yaffs2 and jffs2), however, it's not
> completely ready to work with 16bit NAND flashes. Anyway, I'd like to ask
> for a permission to commit it to let other people start using it/report the
> problems/etc. etc.
>
> Of course input of any kind is welcome.
>
> Best regards,
>    Vitaly


Bloody Marvelous! This is very good news for the yaffs folk.

My only concern/query is a taste issue:
Should the read_oob funtion be used to do the available read or should is it 
better to use a different function like read_ecc() using NULL for the data 
argument?

I have enumerated what I believe to be the pros and cons a few times, and I 
prefer using read_ecc with NULL because this is unambiguous.

However this is a taste issue and to me having a solution is better than 
having an argument!

-- CHarles
