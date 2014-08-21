Received: from iron300.routit.net ([89.146.30.10])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XKXKt-0000x5-Pj
 for linux-mtd@lists.infradead.org; Thu, 21 Aug 2014 18:43:49 +0000
Message-ID: <53F63DC9.9050401@raritan.com>
Date: Thu, 21 Aug 2014 20:43:21 +0200
From: Ronald Wahl <ronald.wahl@raritan.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: cfi_intelext_is_locked() misses get_chip()/put_chip() calls
References: <53F636E0.8030605@raritan.com>
In-Reply-To: <53F636E0.8030605@raritan.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

a possible fix is renaming the current do_getlockstatus_oneblock() 
function to do_getlockstatus_oneblock_unlocked() and write a new
do_getlockstatus_oneblock() which wraps the *_unlocked function into 
get_chip/put_chip. Additional we need to call the *_unlock function from 
do_xxlock_oneblock because it already helds the chip lock.

- ron

On 21.08.2014 20:13, Ronald Wahl wrote:
> Hi,
>
> cfi_intelext_is_locked() in cfi_cmdset_0001.c calls
> do_getlockstatus_oneblock() withou calling get_chip() before and
> put_chip() afterwards. So chip state is changed without protection.
> This may lead to hanging processes.
>
> Is this analysis correct?
>
> If someone can fix this quickly - fine - but I can also provide a patch.
>
> greets,
> ron
>

-- 
Ronald Wahl - ronald.wahl@raritan.com - Phone +49 375271349-0 Fax -99
Raritan Deutschland GmbH, Kornmarkt 7, 08056 Zwickau, Germany
USt-IdNr. DE813094160, Steuer-Nr. 227/117/01749
Amtsgericht Chemnitz HRB 23605
Geschäftsführung: Stuart Hopper, Ralf Ploenes
