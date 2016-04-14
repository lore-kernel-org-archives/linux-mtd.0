Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqbyl-0004Mz-Cm
 for linux-mtd@lists.infradead.org; Thu, 14 Apr 2016 07:46:20 +0000
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May 5 2014))
 with ESMTP id <0O5M001SS5KI3F70@mailout1.w1.samsung.com> for
 linux-mtd@lists.infradead.org; Thu, 14 Apr 2016 08:45:54 +0100 (BST)
Message-id: <570F4AB1.2020600@samsung.com>
Date: Thu, 14 Apr 2016 09:45:53 +0200
From: Jacek Anaszewski <j.anaszewski@samsung.com>
MIME-version: 1.0
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 linux-mtd@lists.infradead.org, linux-leds@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 0/4] LED trigger on MTD activity
References: <1460494002-8578-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <570E0506.4040705@samsung.com> <20160413203905.06371b4c@bbrezillon>
In-reply-to: <20160413203905.06371b4c@bbrezillon>
Content-type: text/plain; charset=ISO-8859-1; format=flowed
Content-transfer-encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On 04/13/2016 08:39 PM, Boris Brezillon wrote:
> Hi Jacek,
>
> On Wed, 13 Apr 2016 10:36:22 +0200
> Jacek Anaszewski <j.anaszewski@samsung.com> wrote:
>
>> Hi Ezequiel,
>>
>> Thanks for the update. From the previous discussion I've inferred
>> that it has been agreed on the whole patch to go through the LED tree.
>>
>> Applied whole patch set to the for-next branch of linux-leds.git,
>> with acks from Boris, then.
>
> Can you provide an immutable branch containing those changes?

No problem, I've created mtd-nand-trigger branch in the repository

git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git

-- 
Best regards,
Jacek Anaszewski
