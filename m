Date: Wed, 23 Apr 2008 14:27:09 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: PATCH: solving a hang while waiting in FL_STATUS
In-Reply-To: <1208946790.9212.782.camel@pmac.infradead.org>
Message-ID: <Pine.LNX.4.64.0804231408140.28908@pentafluge.infradead.org>
References: <15577be70804230157g35941393m599fd5fc2ad895c3@mail.gmail.com>
	<1208946790.9212.782.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, Abel Bernabeu <abel.bernabeu@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,  

> > I am experimenting an infinite loop problem happening at
> > cfi_cmdset_0001.c:chip_ready.
> > 
> > Some kind of timeout while waiting  in FL_STATUS should be included.
> > Indeed, this timeout feature is not new at all.
> > 
> > The feature was present in 2.6.23.17 but disappeared in 2.6.24 (after
> > some refactoring work easily perceptible).
> 
> Hm. This was removed in commit 5a37cf19:
> 	Fix deadlock in Intel chip driver caused by get_chip recursion
> 
> Alexey, can you explain why you removed it? Abel's patch simply adds
> this back where it was. That looks reasonable to me, so I'd like to know
> if I've missed some reason why it shouldn't be there...
> 
>
Yes. I can explain. I removed it because just simple adding timeout
won't work. Please look at the code after patch applying (solving a hang while waiting in FL_STATUS). Time_after will never occur:
--------------
	case FL_STATUS:
		for (;;) {
			status = map_read(map, adr);
			if (map_word_andequal(map, status, status_OK, status_OK))
				break;

			/* At this point we're fine with write operations
			   in other partitions as they don't conflict. */
			if (chip->priv && map_word_andequal(map, status, status_PWS, status_PWS))
				break;

			if (time_after(jiffies, timeo)) {
				printk(KERN_ERR "%s: Waiting for chip to be ready timed out. Status %lx\n",
				       map->name, status.x[0]);
				return -EIO;
			}
			spin_unlock(chip->mutex);
			cfi_udelay(1);
			spin_lock(chip->mutex);
			/* Someone else might have been playing with it. */
			return -EAGAIN;
		}
--------------

I agree that watchdog could be quite useful here, but adding
it properly will lead to rather big changes. That is why Nicolas and me
agreed to kick it off. 

Thanks,
Alexey
