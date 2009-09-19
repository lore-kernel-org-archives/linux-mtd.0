Subject: Re: [PATCH] [MTD] [CHIPS] stm_flash: new ST PSD4256G compatible
	flash  chip driver
From: David Woodhouse <dwmw2@infradead.org>
To: Mike Frysinger <vapier.adi@gmail.com>
In-Reply-To: <8bd0f97a0909191328j6be58c20o9bf4a4c3aadb1634@mail.gmail.com>
References: <1244890798-10908-1-git-send-email-vapier@gentoo.org>
	<1253390936.6317.33.camel@macbook.infradead.org>
	<8bd0f97a0909191328j6be58c20o9bf4a4c3aadb1634@mail.gmail.com>
Content-Type: text/plain
Date: Sat, 19 Sep 2009 14:01:46 -0700
Message-Id: <1253394106.6317.38.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2009-09-19 at 16:28 -0400, Mike Frysinger wrote:
> 
> > Can't you do the same?
> 
> afaik, it isnt JEDEC compliant either.  you can find the data sheet
> here:
> http://www.st.com/stonline/products/literature/ds/8116/psd4256g6v.htm
> 
> so if i created a probe function that created a fake cfi table and
> then called cfi_cmdset_0002(), you think the read/write/erase
> functions would work ?  

At first glance, it looks like that would work, yes. It basically seems
to be the same command set, at its core.

> i dont see any mapping drivers that do this
> kind of thing.  where can i find an example ?

The examples are cfi_probe.c and jedec_probe.c. We have no example of
setting it up _directly_ from a map driver, but that doesn't mean it
can't be done.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
