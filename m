From: David Woodhouse <dwmw2@infradead.org>
To: "Eisenhut, Daniel (MED)" <Daniel.Eisenhut@med.ge.com>
In-Reply-To: <77FE4A1FA59FF947845A42194AD667627731AC@uswaumsx07medge.med.ge.com>
References: 
	 <77FE4A1FA59FF947845A42194AD667627731AC@uswaumsx07medge.med.ge.com>
Content-Type: text/plain
Message-Id: <1080045670.16509.202.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 23 Mar 2004 12:41:10 +0000
Content-Transfer-Encoding: 7bit
cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: Issue with DEBUG_LOCK_BITS
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-03-22 at 17:07 -0600, Eisenhut, Daniel (MED) wrote:
> In cfi_intelext_lock() and cfi_intelext_unlock()... if you have enabled
> DEBUG_LOCK_BITS, do_printlockstatus_oneblock is called which sends the
> command 0xff before returning.  This places the chip in Read Array mode.
> Then do_xxlock_oneblock calls get_chip.  If the chip->state equals
> FL_STATUS, it attempts to read the status register.  This naturally fails
> since it is in Read Array mode, not Read Status mode.

Thanks for the report.

But now you leave it in JEDEC Query mode, not Read Status mode. Surely
the correct fix is to just set chip->state appropriately to reflect what
you've just done to the chip?

Can you test what I just committed to CVS, please?

-- 
dwmw2
