Received: from mail.redswitch.com ([206.14.68.143] helo=redswitch.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17kWZm-00047r-00
	for <linux-mtd@lists.infradead.org>; Thu, 29 Aug 2002 22:11:38 +0100
Received: from [192.168.5.81] (account xjin HELO redswitch.com)
  by redswitch.com (CommuniGate Pro SMTP 3.5.9)
  with ESMTP id 2510945 for linux-mtd@lists.infradead.org; Thu, 29 Aug 2002 14:11:48 -0700
Message-ID: <3D6E8F45.70905@redswitch.com>
Date: Thu, 29 Aug 2002 14:16:53 -0700
From: "Xiaogeng (Shawn) Jin" <xjin@redswitch.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Why this error
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi,

I use the following code to get mtd device pointer:
     mtd = get_mtd_device(NULL, MTD_MINOR);
The compiler always complains that parse error before ;
/* MTD_MINOR is a defined macro. */

But when I call get_mtd_device() in this way, no complain at all.
     int mtd_minor = MTD_MINOR;
     mtd = get_mtd_device(NULL, mtd_minor);

Why does this error happen? Anybody encountered such errors before?

Thanks.

- Shawn.
