Received: from smtp-v.fe.bosch.de ([139.15.237.2])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ErBU4-0005ON-2N
	for linux-mtd@lists.infradead.org; Tue, 27 Dec 2005 04:51:11 -0500
Received: from mta3.fe.internet.bosch.com (unknown [10.4.98.30])
	by imta7.fe.bosch.de (Postfix) with ESMTP id 8AE6A3C031
	for <linux-mtd@lists.infradead.org>;
	Tue, 27 Dec 2005 10:51:06 +0100 (CET)
Received: from si-imc02.de.bosch.com (virusscan7.fe.internet.bosch.com
	[10.4.98.12])
	by mta3.fe.internet.bosch.com (Postfix) with ESMTP id 77E728C019
	for <linux-mtd@lists.infradead.org>;
	Tue, 27 Dec 2005 10:51:06 +0100 (CET)
Message-ID: <43B10E9D.2080206@de.bosch.com>
Date: Tue, 27 Dec 2005 10:51:25 +0100
From: Dirk Behme <dirk.behme@de.bosch.com>
MIME-Version: 1.0
To: Vitaly Wool <vwool@ru.mvista.com>
References: <43B031A7.1030504@de.bosch.com> <43B0E2B4.6050309@ru.mvista.com>
In-Reply-To: <43B0E2B4.6050309@ru.mvista.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Oops using cfi_cmdset_0002.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Vitaly Wool wrote:
> Anyway, this looks like either a misconfiguration or a result of an 
> write access past the allocated space.

Yes, it was a misconfiguration. The size was automatically detected
correctly, but somewhere else there was still a wrong size defined
statically. Because of the confusing oops I searched at the complete
wrong place. So many thanks for the hint.

Best regards

Dirk
