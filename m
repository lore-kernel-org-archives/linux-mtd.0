Received: from smtp-out.google.com ([216.239.45.12])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FecDb-00041b-Nb
	for linux-mtd@lists.infradead.org; Fri, 12 May 2006 14:18:34 -0400
Received: from vegeta.corp.google.com (vegeta.corp.google.com [172.24.0.3])
	by smtp-out.google.com with ESMTP id k4CIIBXh011445
	for <linux-mtd@lists.infradead.org>; Fri, 12 May 2006 11:18:12 -0700
Received: from smtp-out2.google.com (fpr7.prod.google.com [10.253.18.7])
	by vegeta.corp.google.com with ESMTP id k4CEO6wJ007784
	for <linux-mtd@lists.infradead.org>; Fri, 12 May 2006 11:18:10 -0700
Received: by smtp-out2.google.com with SMTP id 7so275058fpr
	for <linux-mtd@lists.infradead.org>;
	Fri, 12 May 2006 11:18:10 -0700 (PDT)
Message-ID: <50e923300605121118wca72278h967bc5d685bf68ae@mail.google.com>
Date: Fri, 12 May 2006 11:18:10 -0700
From: "Peter Hanson" <peterh@google.com>
To: "David Vrabel" <dvrabel@arcom.com>
In-Reply-To: <44635DD6.10805@arcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <c384c5ea0605110820m606a04e7nc87cbc9302fd619c@mail.gmail.com>
	<44635DD6.10805@arcom.com>
Cc: Leon Woestenberg <leon.woestenberg@gmail.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Do not oops when configured flash size is less then
	chip size
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/11/06, David Vrabel <dvrabel@arcom.com> wrote:
> Leon Woestenberg wrote:
[snip]
> This sounds like a valid, if unlikely, board configuration.  e.g., a
> board with chips fitted that are larger than the chip-select memory windo=
w.
[/snip]

Not so very unlikely.  A product update may call for lashing upgraded
flash chips into a clunky old design.  MPC82xx chips are still
shipping, and their legacy ROM chip selects are smaller than many
modern flash chips.

Mind you, I'm not saying MTD _should_ support such nonsense.  But one
definition of `driver' is `n. Software written to paper over the flaws
of your brain dead hardware.'
