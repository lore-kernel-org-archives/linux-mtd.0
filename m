From: David Woodhouse <dwmw2@infradead.org>
To: "Ellec, Chris" <cellec@celerity.net>
In-Reply-To: <E025AA91F3FF3D44A8E713E82C9D359793EA19@ca2smail1.celeritynet.net>
References: 
	 <E025AA91F3FF3D44A8E713E82C9D359793EA19@ca2smail1.celeritynet.net>
Content-Type: text/plain
Message-Id: <1067357435.15551.450.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 28 Oct 2003 16:10:35 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: INFTL and MAKEDEV
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-10-28 at 08:07 -0800, Ellec, Chris wrote:
> shouldn't the major number be 93 for both mknod or 94 for both mknod,
> instead of one of each ?

It should; now fixed in CVS. Thanks.

-- 
dwmw2
