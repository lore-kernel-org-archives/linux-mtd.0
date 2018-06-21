Received: from [1.203.163.78] (helo=mailgw01.mediatek.com)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVvcu-00010D-QN
 for linux-mtd@lists.infradead.org; Thu, 21 Jun 2018 09:11:38 +0000
Message-ID: <1529571876.14673.77.camel@mhfsdcap03>
Subject: UBIFS assert when create new sub-dir under a transmute enabled dir
 with Smack enabled
From: xiaolei li <xiaolei.li@mediatek.com>
To: <richard@nod.at>
CC: <leqiao.peng@valeo.com>, <casey@schaufler-ca.com>,
 <linux-mtd@lists.infradead.org>, <xiaolei.li@mediatek.com>
Date: Thu, 21 Jun 2018 17:04:36 +0800
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

I ever committed one patch[1] to fix ubifs assert in ubifs_xattr_set()
if Smack is enabled.
It almost always runs OK except "creating new sub-dir under a transmute
enabled dir" which is found by Mr.Leqiao Peng. For this special case,
there still has ubifs assert problem.

With patch[1], this problem can be reproduced by these steps ( assume
that the Smack has been enabled and the Smack userspace tool also
installed ):
1). Add new smack rule in which the "aaa" for process object, "bbb" for
file or directory object.  "xwt" for the permission "execute, write and
transmute"

echo "aaa bbb xwt" | smackload

2). Apply the label "aaa" to current sh process.   Verify the effect by
"ps -Z" 

echo aaa > /proc/self/attr/current

3) Create a directory "test_dir" and assign the "bbb" label and enable
the transmute feature upon the new directory. 
Verify this by "chsmack test_dir". 

mkdir test_dir
chsmack -a "bbb" -t test_dir

4) Create a new directory "newDir" under the "test_dir". 

mkdir test_dir/newDir


Then, ubifs assert happens, and the stack trace is:

UBIFS assert failed in __ubifs_setxattr at 284 (pid 4041)
CPU: 2 PID: 4041 Comm: mkdir Tainted: G S      W       4.9.90 #1
Call trace:
[<ffffff8008089ff8>] dump_backtrace+0x0/0x1d8
[<ffffff800808a254>] show_stack+0x24/0x30
[<ffffff800845f074>] dump_stack+0x94/0xb8
[<ffffff80083cdd78>] __ubifs_setxattr+0x358/0x5f8
[<ffffff80083ce384>] ubifs_xattr_set+0x64/0x3d0
[<ffffff800826c3bc>] __vfs_setxattr+0x7c/0x98
[<ffffff8008416d64>] smack_d_instantiate+0x304/0x350
[<ffffff800840cdec>] security_d_instantiate+0x4c/0x78
[<ffffff800825ca1c>] d_instantiate+0x3c/0x70
[<ffffff80083ab158>] ubifs_mkdir+0x1d8/0x1e0
[<ffffff800824f140>] vfs_mkdir2+0x128/0x1b0
[<ffffff8008254738>] SyS_mkdirat+0x80/0xf0
[<ffffff800808378c>] __sys_trace_return+0x0/0x4

Mr. Schaufler (original developer of SMACK) has analyzed the possible
root cause:
"I have confirmed this behavior. The issue is that the inode isn't
locked during inode instantiation. It doesn't need to be, because until
instatiation is complete the inode doesn't really exist and isn't
accessible to any other task. The assertion in the ubifs code is not
appropriate. I suggest that you contact the ubifs maintainers.
Please CC me, and I will answer any questions they may have. Thank you
for the report."

Could you kindly have a look at this problem? Thanks very much!

[1] https://patchwork.kernel.org/patch/9805535/

Thanks!
Xiaolei Li
