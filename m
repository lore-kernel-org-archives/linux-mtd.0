Received: from mtagate6.uk.ibm.com ([195.212.29.139])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KXZhw-0004KJ-LM
	for linux-mtd@lists.infradead.org; Mon, 25 Aug 2008 10:54:01 +0000
Received: from d06nrmr1407.portsmouth.uk.ibm.com
	(d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate6.uk.ibm.com (8.13.8/8.13.8) with ESMTP id m7PAqqZj198384
	for <linux-mtd@lists.infradead.org>; Mon, 25 Aug 2008 10:52:52 GMT
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com
	[9.149.37.216])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v9.0) with
	ESMTP id m7PAqqfP3047562
	for <linux-mtd@lists.infradead.org>; Mon, 25 Aug 2008 11:52:52 +0100
Received: from d06av04.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id m7PAqpQS006397
	for <linux-mtd@lists.infradead.org>; Mon, 25 Aug 2008 11:52:51 +0100
Message-ID: <48B28F00.10202@de.ibm.com>
Date: Mon, 25 Aug 2008 12:52:48 +0200
From: Carsten Otte <cotte@de.ibm.com>
MIME-Version: 1.0
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>
Subject: Re: [PATCH 00/10] AXFS: Advanced XIP filesystem
References: <48AD00C4.6060302@gmail.com>
	<Pine.LNX.4.64.0808221650500.17105@vixen.sonytel.be>
	<6934efce0808220951i5a2cd6f9t70f9c522eae6f1d6@mail.gmail.com>
	<Pine.LNX.4.64.0808251136140.3893@vixen.sonytel.be>
In-Reply-To: <Pine.LNX.4.64.0808251136140.3893@vixen.sonytel.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: nickpiggin@yahoo.com.au, linux-embedded@vger.kernel.org,
	=?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern@logfs.org>,
	Linux-kernel@vger.kernel.org,
	linux-mtd <linux-mtd@lists.infradead.org>, tim.bird@am.sony.com
Reply-To: carsteno@de.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Geert Uytterhoeven wrote:
> From your good relationship with the s390 developers, I had hoped you would
> have done some tests on s390 ;-)
Haha, we let you sort out the endianess issues first and then take the 
easy path :-). We have'nt tried it yet so far.
