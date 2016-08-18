Received: from gproxy6-pub.mail.unifiedlayer.com ([67.222.39.168])
 by bombadil.infradead.org with smtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1baBqe-0000p3-Im
 for linux-mtd@lists.infradead.org; Thu, 18 Aug 2016 01:10:22 +0000
Subject: Re: [PATCH 06/15] genhd: Add return code to device_add_disk
To: Fam Zheng <famz@redhat.com>, Cornelia Huck <cornelia.huck@de.ibm.com>
References: <1471418115-3654-1-git-send-email-famz@redhat.com>
 <1471418115-3654-7-git-send-email-famz@redhat.com>
 <20160817104914.37087cb3.cornelia.huck@de.ibm.com>
 <20160817084823.GB19326@al.usersys.redhat.com>
 <20160817110645.45370f57.cornelia.huck@de.ibm.com>
 <20160817091422.GE19326@al.usersys.redhat.com>
Cc: linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 linux-block@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Ellerman
 <mpe@ellerman.id.au>, virtualization@lists.linux-foundation.org,
 linux-nvme@lists.infradead.org, Keith Busch <keith.busch@intel.com>,
 Minchan Kim <minchan@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, David Woodhouse <dwmw2@infradead.org>,
 Nitin Gupta <ngupta@vflare.org>
From: Ed Cashin <ed.cashin@acm.org>
Message-ID: <57B50AD1.6010403@acm.org>
Date: Wed, 17 Aug 2016 21:09:37 -0400
MIME-Version: 1.0
In-Reply-To: <20160817091422.GE19326@al.usersys.redhat.com>
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

On 08/17/2016 05:14 AM, Fam Zheng wrote:
...
> Of course, the plan is to write patches on top. I'm not cleaning up anything
> here because I'm concerned callers may double free (and I didn't look hard into
> that).

Aside from Huck's concerns, the changes looked OK from aoe's perspective.

-- 
   Ed
