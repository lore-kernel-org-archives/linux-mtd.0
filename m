Received: from mail.adb.com.ua ([193.105.30.103])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUCkL-0008MZ-Tu
 for linux-mtd@lists.infradead.org; Tue, 15 May 2012 08:04:42 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.adb.com.ua (Postfix) with ESMTP id DEC00387260
 for <linux-mtd@lists.infradead.org>; Tue, 15 May 2012 10:57:27 +0300 (EEST)
Received: from mail.adb.com.ua ([127.0.0.1])
 by localhost (mail.adb.com.ua [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BCrmcjpEAe-Q for <linux-mtd@lists.infradead.org>;
 Tue, 15 May 2012 10:57:26 +0300 (EEST)
Received: from [192.168.23.7] (dmaluka.adb.ua [192.168.23.7])
 by mail.adb.com.ua (Postfix) with ESMTPS id BB3D938725F
 for <linux-mtd@lists.infradead.org>; Tue, 15 May 2012 10:57:26 +0300 (EEST)
Message-ID: <4FB20E0E.5000005@adbglobal.com>
Date: Tue, 15 May 2012 11:04:30 +0300
From: Dmitry Maluka <D.Maluka@adbglobal.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Missing offset increment in scan_read_raw_oob()
References: <4FAD51B7.6010303@adbglobal.com>
 <1337065400.2528.120.camel@sauron.fi.intel.com>
In-Reply-To: <1337065400.2528.120.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/15/2012 10:03 AM, Artem Bityutskiy wrote:
> I pushed it to l2-mtd.git, but please, tell how you found this issue.

Just by reading the code. I do not use NAND_BBT_SCANALLPAGES so I think
I couldn't face this bug.

> Also you did not provide signed-off-by - can I add this:
> 
> Signed-off-by: Dmitry Maluka <D.Maluka@adbglobal.com>
> 
> ?
> 
> Also note, the patch was line-wrapped and did not apply, so I had to
> amend it.

Ok, no problem.
