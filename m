Received: from 71-19-161-253.dedicated.allstream.net ([71.19.161.253]
 helo=nsa.nbspaymentsolutions.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRU5u-0007oB-33
 for linux-mtd@lists.infradead.org; Wed, 02 Oct 2013 21:36:31 +0000
From: Bill Pringlemeir <bpringlemeir@nbsps.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 7/7] UBI: Add some asserts to ubi_attach_fastmap()
References: <1380376516-30144-1-git-send-email-richard@nod.at>
 <1380376516-30144-8-git-send-email-richard@nod.at>
 <CACQ1gAiaSeF0EP9KubJ7SRrLFc=gKq+wEHenFFw-BxJoCx203Q@mail.gmail.com>
Date: Wed, 02 Oct 2013 17:32:01 -0400
Message-ID: <874n8zuzou.fsf@nbsps.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Richard Genoud <richard.genoud@gmail.com>,
 Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 30 Sep 2013, richard.genoud at gmail.com wrote:

> 2013/9/28 Richard Weinberger <richard at nod.at>:
>> Add more paranioa asserts to make it easier to detect
>> implementation errors.
>>
>> Signed-off-by: Richard Weinberger <richard at nod.at>
>
> Tested-by: Richard Genoud <richard.genoud at gmail.com>

As I reported here,

 http://lists.infradead.org/pipermail/linux-mtd/2013-August/048102.html

This patch-set seems to fix the issue I encountered as well.  I
reflashed my saved image with the updated patch set and the file system
successfully mounts.  Although in my case, it was back-ported.

Fwiw,
Bill Pringlemeir.
