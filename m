Received: from gproxy1-pub.mail.unifiedlayer.com ([69.89.25.95])
 by bombadil.infradead.org with smtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bImms-00080M-AH
 for linux-mtd@lists.infradead.org; Fri, 01 Jul 2016 00:58:31 +0000
Subject: Re: [PATCH v2 05/12] aoeblk: Generate uevent after attribute available
To: Fam Zheng <famz@redhat.com>, linux-kernel@vger.kernel.org
References: <20160630015953.6888-1-famz@redhat.com>
 <20160630015953.6888-6-famz@redhat.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Jens Axboe <axboe@kernel.dk>, Jiri Kosina <jikos@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Minchan Kim <minchan@kernel.org>,
 Nitin Gupta <ngupta@vflare.org>,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Shaohua Li <shli@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Keith Busch <keith.busch@intel.com>, linuxppc-dev@lists.ozlabs.org,
 linux-block@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-nvme@lists.infradead.org,
 Christoph Hellwig <hch@infradead.org>
From: Ed Cashin <ed.cashin@acm.org>
Message-ID: <5775C009.3010000@acm.org>
Date: Thu, 30 Jun 2016 20:57:45 -0400
MIME-Version: 1.0
In-Reply-To: <20160630015953.6888-6-famz@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/29/2016 09:59 PM, Fam Zheng wrote:
> It is documented that KOBJ_ADD should be generated after the object's
> attributes and children are ready.  We can achieve this with the new
> disk_gen_uevents interface.

Looks like an improvement, thanks!

-- 
   Ed
