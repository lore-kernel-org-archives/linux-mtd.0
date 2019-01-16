From: bbrezillon@kernel.org (Boris Brezillon)
Date: Wed, 16 Jan 2019 09:40:53 +0100
Subject: mtd: gen_probe: Use struct_size() in kmalloc()
In-Reply-To: <20190108153601.GA11557@embeddedor>
Message-ID: <20190116084053.29791-1-bbrezillon@kernel.org>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

From: Boris Brezillon <boris.brezillon@bootlin.com>

On Tue, 2019-01-08 at 15:36:01 UTC, "Gustavo A. R. Silva" wrote:
> One of the more common cases of allocation size calculations is finding
> the size of a structure that has a zero-sized array at the end, along
> with memory for some number of elements for that array. For example:
> 
> struct foo {
>     int stuff;
>     void *entry[];
> };
> 
> instance = kmalloc(sizeof(struct foo) + sizeof(void *) * count, GFP_KERNEL);
> 
> Instead of leaving these open-coded and prone to type mistakes, we can
> now use the new struct_size() helper:
> 
> instance = kmalloc(struct_size(instance, entry, count), GFP_KERNEL);
> 
> This code was detected with the help of Coccinelle.
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Applied to http://git.infradead.org/linux-mtd.git mtd/next, thanks.

Boris
