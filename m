From: David Woodhouse <dwmw2@infradead.org>
To: liu zixing <liuzixing@hotmail.com>
In-Reply-To: <BAY7-F101vNGXa1VPAq0002ccc2@hotmail.com>
References: <BAY7-F101vNGXa1VPAq0002ccc2@hotmail.com>
Content-Type: text/plain
Message-Id: <1078221144.17069.70.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 02 Mar 2004 09:52:25 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: compile error
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-03-02 at 17:42 +0800, liu zixing wrote:
> I work on a board with Xscale IXP425 , I want to make a DiskOnChip 2000 as 
> a storage device.
> We already have a linux kernel-2.4.21-rmk1-ds1 run on it.
> I download the linux driver for DOC from m-systems.com, and configure the 
> "M-systems driver" as a module.

Do not ask questions about the illegal binary-only module here.

Use the DiskOnChip driver which is contained in the 2.4.21-rmk1-ds1
kernel instead.

-- 
dwmw2
