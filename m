From: dwmw2@infradead.org (David Woodhouse)
Date: 11 Mar 2003 17:50:09 +0000
Subject: Memory leak
In-Reply-To: <000e01c2e65b$71ca7020$210486da@ybb>
References: <000e01c2e65b$71ca7020$210486da@ybb>
Message-ID: <1047405009.24808.254.camel@passion.cambridge.redhat.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Sun, 2003-03-09 at 16:46, matsunaga wrote:
> I am testing on NAND flash.
> There seems memory leak when you mount and unmount a device with some data.
> Dnode resource acquired during mount seems not to be freed during unmount.

Mea Culpa. It was introduced with the latest round of GC/crc changes. It
should be fixed in CVS now.


-- 
dwmw2
