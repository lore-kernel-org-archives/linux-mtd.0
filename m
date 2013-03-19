Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHyGe-00062N-TT
 for linux-mtd@lists.infradead.org; Tue, 19 Mar 2013 15:16:01 +0000
Message-ID: <5148812A.1040607@parrot.com>
Date: Tue, 19 Mar 2013 16:15:54 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: David Mosberger-Tang <dmosberger@gmail.com>
Subject: Re: RE : ONFI patch
References: <CACwUX0OGZivc3pui7Kgo=Y+Tp+dP7UszR_DNN3-pzovo0L7LAg@mail.gmail.com>	<C429A122CB68254FACED4BEF16AA357A538A5392AA@OPALE.xi-lite.lan>	<CACwUX0P4NeuuFy7q5OgE21m-J9reoXRFO-QL7z76+XVaxure3A@mail.gmail.com>	<51473C88.4000105@parrot.com>
 <CACwUX0Ma9BxmORGV31D3=Des7P-R0pL_V4ETPTXSxugQM+Bizw@mail.gmail.com>
In-Reply-To: <CACwUX0Ma9BxmORGV31D3=Des7P-R0pL_V4ETPTXSxugQM+Bizw@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Mosberger-Tang a écrit :
> Matthieu,
> 

> 
> 
> I was afraid that might be the case.  Since there is no write_byte
> callback, would it be OK if we convert the subfeature_param to 16 bits
> and then write it using the write_buf callback?  If so, I can code that up.
Yes may be that's the best solution

And while we have a 16 bits version of nand_onfi_set_features we send :
chip->cmdfunc(mtd, NAND_CMD_SET_FEATURES, addr<<1, -1);


Matthieu
