Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LEmyR-00042e-NJ
	for linux-mtd@lists.infradead.org; Mon, 22 Dec 2008 15:45:40 +0000
Message-ID: <494FB83A.7030806@nokia.com>
Date: Mon, 22 Dec 2008 17:54:34 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: "Bruce_Leonard@selinc.com" <Bruce_Leonard@selinc.com>
Subject: Re: UBIFS failures
References: <OF7D8D85A1.8CD2CCD5-ON88257521.007FE753-88257521.00803388@selinc.com>
In-Reply-To: <OF7D8D85A1.8CD2CCD5-ON88257521.007FE753-88257521.00803388@selinc.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Bityutskiy Artem \(Nokia-M/Helsinki\)" <Artem.Bityutskiy@nokia.com>,
	Barry_Grussling@selinc.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

You should add at least the following patches to mainline 2.6.27

http://git.infradead.org/users/dedekind/ubifs-v2.6.27.git?a=commitdiff;h=52619e5dd7c728a88234fe2e22b4acdbf8bb61cb
http://git.infradead.org/users/dedekind/ubifs-v2.6.27.git?a=commitdiff;h=805367207273a625ba2eed97b96154d3a99b706e
http://git.infradead.org/users/dedekind/ubifs-v2.6.27.git?a=commitdiff;h=442c54405668322d629fd6bd765ca401ce2b8e19

Regards
Adrian
