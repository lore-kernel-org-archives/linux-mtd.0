Date: Wed, 29 Jun 2016 23:24:42 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Fam Zheng <famz@redhat.com>
Cc: linux-kernel@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Jens Axboe <axboe@kernel.dk>,
 "Ed L. Cashin" <ed.cashin@acm.org>, Jiri Kosina <jikos@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Minchan Kim <minchan@kernel.org>, Nitin Gupta <ngupta@vflare.org>,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Shaohua Li <shli@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Keith Busch <keith.busch@intel.com>, linuxppc-dev@lists.ozlabs.org,
 linux-block@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-nvme@lists.infradead.org,
 dan.j.williams@intel.com
Subject: Re: [PATCH v2 00/12] gendisk: Generate uevent after attribute
 available
Message-ID: <20160630062442.GA19761@infradead.org>
References: <20160630015953.6888-1-famz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160630015953.6888-1-famz@redhat.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 30, 2016 at 09:59:41AM +0800, Fam Zheng wrote:
> Documentation/kobject.txt:
> > Use the KOBJ_ADD action for when the kobject is first added to the kernel.
> > This should be done only after any attributes or children of the kobject
> > have been initialized properly, as userspace will instantly start to look
> > for them when this call happens.
> 
> Unfortunately it seems impossible to fix this generally without touching the
> offending callers.  The approach I'm proposing here is adding a flag to
> suppress uevent in add_disk(), which is patch 1, then in later patches, convert
> any caller to only trigger the uevent when attributes are added.

We (or rather Dan) is touching most add_disk callers anyway for the
driverfs_dev removal.  Let's just pass the array of attributes to
a disk_add variant and solve the issue for real.
