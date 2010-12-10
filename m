Received: from msag503.nifty.com ([202.248.238.124])
	by casper.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PR6s7-0000pl-Ks
	for linux-mtd@lists.infradead.org; Fri, 10 Dec 2010 17:35:08 +0000
Received: from [192.168.24.99] (p3225-ipbfp402wakayama.wakayama.ocn.ne.jp
	[122.22.125.225]) (authenticated)
	by msag503.nifty.com with ESMTP id oBAHYshu013870
	for <linux-mtd@lists.infradead.org>; Sat, 11 Dec 2010 02:34:54 +0900
Message-ID: <4D0264BF.6060904@gmail.com>
Date: Sat, 11 Dec 2010 02:34:55 +0900
From: Tarosa <tarosa.y@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Please teach UBI
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello.

Because I do not usually use English, unknown sentences might be written.

It is a basic question.
UBI is an array of the initial of "Unsorted block images". Please teach the
meaning of this "Unsorted block images".
Was there a filesystem of "Sorted block images" in the past?
What after the filesystem is different as for not sorting block images?
Where of UBI is unsorted block images?
I do not understand. Please tell me.

There are another and a question.
It is defined that CONFIG_MTD_UBI_WL_THRESHOLD is 4096. It is thought this is to
mean WL is done as difference between a maximum  and a minimum  of the value of
erace counter of PEBs are always in the range of 4096*2(=8192).

Why is it 8192 ?
In a value that is bigger than 8192, isn't it good? Or, isn't it good in a
narrower range?
Isn't there what changed by the character of mtd?
Please teach to me.

My best regards.

-- 
tarosa yamamoto
E-Mail: tarosa.y@gmail.com
