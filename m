From: matsunaga_kazuhisa@yahoo.co.jp (matsunaga)
Date: Mon, 10 Mar 2003 01:46:34 +0900
Subject: Memory leak
Message-ID: <000e01c2e65b$71ca7020$210486da@ybb>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hi all

I am testing on NAND flash.
There seems memory leak when you mount and unmount a device with some data.
Dnode resource acquired during mount seems not to be freed during unmount.

Best regards.
__________________________________________________
Do You Yahoo!?
Yahoo! BB is Broadband by Yahoo!  http://bb.yahoo.co.jp/
