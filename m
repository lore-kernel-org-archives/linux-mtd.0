From: Russ.Dill@asu.edu (Russ Dill)
Date: 04 Mar 2003 03:02:09 -0700
Subject: AMD - Am29LV160B
In-Reply-To: <04C8EDC5AE3FD611ABE40002B39CF69B07F2E0@ntah901e.savan.com>
References: <04C8EDC5AE3FD611ABE40002B39CF69B07F2E0@ntah901e.savan.com>
Message-ID: <1046772128.3368.6.camel@gobbles>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Tue, 2003-03-04 at 02:35, Amit.Lubovsky at infineon.com wrote:
> Thanks,
> 
> 
> I have applied BUSWIDTH 4 in the mapping driver and my
> 
> 	Memory Technology Devices (MTD)  ---> RAM/ROM/Flash chip drivers
> 
> looks like:

again, the quickest way of tracking this down is to add in some printk's
so you know whats being read/written, and then possibly some more
printk's in the CFI stuff so you know what is being expected. From
there, its usually pretty easy to track down.
