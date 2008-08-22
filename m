Received: from mtagate1.de.ibm.com ([195.212.17.161])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KWR2c-0000j7-AK
	for linux-mtd@lists.infradead.org; Fri, 22 Aug 2008 07:26:39 +0000
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate1.de.ibm.com (8.13.1/8.13.1) with ESMTP id m7M7QYdl006026
	for <linux-mtd@lists.infradead.org>; Fri, 22 Aug 2008 07:26:34 GMT
Received: from d12av04.megacenter.de.ibm.com (d12av04.megacenter.de.ibm.com
	[9.149.165.229])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v9.0) with
	ESMTP id m7M7QY2M1335318
	for <linux-mtd@lists.infradead.org>; Fri, 22 Aug 2008 09:26:34 +0200
Received: from d12av04.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av04.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id m7M7QXox018566
	for <linux-mtd@lists.infradead.org>; Fri, 22 Aug 2008 09:26:34 +0200
Message-ID: <48AE6A27.9070103@de.ibm.com>
Date: Fri, 22 Aug 2008 09:26:31 +0200
From: Carsten Otte <cotte@de.ibm.com>
MIME-Version: 1.0
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [PATCH 05/10] AXFS: axfs_profiling.c
References: <48AD00F8.1030004@gmail.com> <200808211339.37187.arnd@arndb.de>
	<6934efce0808210755n1977e085o63b8b91e84575dc9@mail.gmail.com>
	<200808211706.37761.arnd@arndb.de>
	<6934efce0808210817h489bbeafyaf27217ca68bd31e@mail.gmail.com>
In-Reply-To: <6934efce0808210817h489bbeafyaf27217ca68bd31e@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Arnd Bergmann <arnd@arndb.de>, linux-embedded@vger.kernel.org,
	carsteno@de.ibm.com, =?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern@logfs.org>,
	Linux-kernel@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: carsteno@de.ibm.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jared Hulbert wrote:
>> The profiling code has certainly been useful to you during development,
>> and you should keep that code around for your own work on it,
>> but maybe you should not push that upstream, because regular users
>> are not going to need it.
> 
> Nope.  Profiling is absolutely fundamental to how AXFS works.  Read
> the [PATCH 00/10] thread again.
I agree, the profiling part is the sweet spot. Profiling should be in, 
probably even selectable at runtime as opposed to a config-switch. 
This way we could have it in enterprise distros that would'nt build 
another kernel image for this.
