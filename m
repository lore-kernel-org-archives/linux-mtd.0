From: manningc2@actrix.gen.nz (Charles Manning)
Date: Mon, 10 Mar 2003 06:37:50 +1300
Subject: Memory leak
In-Reply-To: <000e01c2e65b$71ca7020$210486da@ybb>
References: <000e01c2e65b$71ca7020$210486da@ybb>
Message-ID: <20030309174303.3F3B020C05F@blood.actrix.co.nz>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

What file system are you using?
On Mon, 10 Mar 2003 05:46, matsunaga wrote:
> Hi all
>
> I am testing on NAND flash.
> There seems memory leak when you mount and unmount a device with some data.
> Dnode resource acquired during mount seems not to be freed during unmount.
