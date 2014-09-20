Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XVCn7-0000n3-Ki
 for linux-mtd@lists.infradead.org; Sat, 20 Sep 2014 05:01:02 +0000
Message-ID: <541D09C9.4080004@huawei.com>
Date: Sat, 20 Sep 2014 12:59:53 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: [PATCH RFC v3] ubi-utils: Introduce a utility ubidump
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Bill Pringlemeir <bpringlemeir@nbsps.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

It's about two months after the pushing of my v2 patches. I'd like
to resend these v3 patches and discuss with you about the debugging
of UBIFS. I wish you are not tried with this stuff.

I have to say these v3 patches don't make a great difference with
the previous versions. Just simplify, I've removed ubi-level dump.
So the lpt-leb dump is not supported as before. I want to know if
we could start at this version and add other functionality step by
step.

Thanks~!

v1:
http://lists.infradead.org/pipermail/linux-mtd/2014-July/054541.html

v2:
http://lists.infradead.org/pipermail/linux-mtd/2014-July/054831.html

Changes in v3:
 - Remove ubi-level dump so we don't need to worry about how to
   get ubi-level info from an UBI device.
 - Read ubifs stuff by read() ops which is provided by UBI driver.
