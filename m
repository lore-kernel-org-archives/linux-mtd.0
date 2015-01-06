Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8JGv-0003JA-7K
 for linux-mtd@lists.infradead.org; Tue, 06 Jan 2015 01:49:26 +0000
Message-ID: <54AB3EEC.2080500@huawei.com>
Date: Tue, 6 Jan 2015 09:48:28 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Joseph Balough <jbb5044@gmail.com>
Subject: Re: [PATCH 2/2] mtd: ubiformat: Add confirmation fail exit
References: <1420037925-31156-1-git-send-email-jbb5044@gmail.com>
 <1420037925-31156-3-git-send-email-jbb5044@gmail.com>
 <54A8A7A1.8060802@huawei.com>
 <CACuXwh5eGfpQ6=qJH2_O5yGiK82pxF1mJHaG8X+Hpa50P5PZww@mail.gmail.com>
In-Reply-To: <CACuXwh5eGfpQ6=qJH2_O5yGiK82pxF1mJHaG8X+Hpa50P5PZww@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2015/1/5 23:07, Joseph Balough wrote:
> 
> On Sat, Jan 3, 2015 at 9:38 PM, hujianyang <hujianyang@huawei.com <mailto:hujianyang@huawei.com>> wrote:
> 
> 
>     There is not need to return different values for any error cases, and a
>     positive return value is not proper for a aborted case.
> 
>     Just print a error message at failure happening is enough, I think.
> 
> 
> It was useful for me to know what the specific error was -- A messed up ubi file could indicate a bad download while a confirm error could indicate bad flash. It's no problem for me, I can just leave my patch as something I apply locally. I do wonder about the current exit value on error. ubiformat currently exits -1 when there is an error. The exit status for programs in UNIX are 8-bit unsigned integers, so the program actually exits 255. Perhaps this should at least return 1 instead of -1.

The exit status for programs in UNIX are 8-bit unsigned integers, so the program actually exits 255. Perhaps this should at least return 1 instead of -1.


Yes, you are right~!

Sorry for it.
