Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G2oTr-00022I-NT
	for linux-mtd@lists.infradead.org; Tue, 18 Jul 2006 08:15:20 -0400
Message-ID: <44BCD0D6.5050301@ru.mvista.com>
Date: Tue, 18 Jul 2006 16:15:18 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: Davide CASCONE <davide.cascone@st.com>
Subject: Re: nandwrite fix
References: <000201c6aa5f$7c79f420$253682a4@nap.st.com>
In-Reply-To: <000201c6aa5f$7c79f420$253682a4@nap.st.com>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Davide CASCONE wrote:
> Now the nandwrite utility works properly, but I think it's better to define a macro in order to select the correct jffs2_oobinfo struct depending on the device page size. What do you think about?
>
>   
My POV is that it's better to never use anything but autoplacement and 
remove jffs2_oobinfo from nandwrite completely.

Vitaly
