Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MaOyA-0006IZ-Ii
	for linux-mtd@lists.infradead.org; Mon, 10 Aug 2009 07:07:03 +0000
Message-ID: <4A7FC68B.7070404@gmail.com>
Date: Mon, 10 Aug 2009 10:04:43 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: Josh Boyer <jwboyer@gmail.com>
Subject: Re: [patch 6/8] slram: fix read buffer overflow
References: <200908062305.n76N5aeS004967@imap1.linux-foundation.org>
	<20090807025847.GM3095@hansolo.jdub.homelinux.org>
In-Reply-To: <20090807025847.GM3095@hansolo.jdub.homelinux.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, akpm@linux-foundation.org, roel.kluin@gmail.com,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/07/2009 05:58 AM, Josh Boyer wrote:
> On Thu, Aug 06, 2009 at 04:05:36PM -0700, akpm@linux-foundation.org wrote:
>> From: Roel Kluin<roel.kluin@gmail.com>
>>
>> map[count] is checked before count<  SLRAM_MAX_DEVICES_PARAMS
>>
>> declared on drivers/mtd/devices/slram.c:66:
>
> Didn't we obsolete this driver with phram?  I don't mean to derail the patch,
> but I'm wondering why slram still exists at all.

Feel free to send a patch. Meanwhile, I've put this fix to my l2-mtd-2.6.git.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
