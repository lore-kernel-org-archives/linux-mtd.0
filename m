Received: from megamail.megared.com.mx ([200.52.207.52]
	helo=unix.megared.net.mx)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DREqf-0006JK-J8
	for linux-mtd@lists.infradead.org; Thu, 28 Apr 2005 15:38:59 -0400
Received: from [10.40.241.247] ([10.40.241.247])
	by unix.megared.net.mx (8.11.7/8.11.7) with ESMTP id j3SJcpR49938
	for <linux-mtd@lists.infradead.org>;
	Thu, 28 Apr 2005 14:38:53 -0500 (CDT)
Message-ID: <42713BCB.8080107@didtec.com.mx>
Date: Thu, 28 Apr 2005 14:38:51 -0500
From: Cuauhtemoc Covarrubias Carranza <temoc@didtec.com.mx>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Subject: pxa263 flash memory (Strataflash K3)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
We are developing a PDA using Intel's PXA263 which contains K3 flash 
memory. I'm using kernel 2.4.19-rmk7-pxa2

The problem is the following:
After powerup, any operation on the flash partitions (unlock, erase, 
mount) finishes with a timeout, but only if the partition already has 
data (i.e. if the partition is blank, all operations are completed ok).

I believe there is because I have a buggy K3.
Is there a patch for this kernel version who resolves this issue? or 
what kernel version must be used?

Thanks

-- 
--
Cuauhtemoc Covarrubias
Hardware Design Engineer
Diseño y Desarrollo Tecnologico, S.C.
Tel./Fax +52 33 3126 0861
temoc@didtec.com.mx

--
Esta comunicación es confidencial y dirigida solamente para el
destinatario. Se prohíbe cualquier revisión, uso, acceso o distribución
no autorizada. Si usted cree que este mensaje se le ha enviado por error,
notificar por favor el remitente contestando a esta transmisión y borrar
este mensaje sin divulgarlo. Gracias.

Los correos electrónicos que incluyen archivos adjuntos, son susceptibles
a la corrupción de información, interrupción o enmiendas no autorizadas,
falsificación y virus, por lo tanto nosotros solamente enviamos y recibimos
correos electrónicos bajo la base de que no somos responsables por ningún
tipo de corrupción, enmienda, intercepción, falsificación o virus o por
cualquier consecuencia derivada de lo anterior.
----------------------------------------------------------------------------
This message contains confidential information and is intended only for
the individual named. If you are not the named addressee you should not
disseminate, distribute or copy this e-mail. Please notify the sender
immediately by e-mail if you have received this e-mail by mistake and
delete this e-mail from your system. E-mail transmission cannot be
guaranteed to be secure or error-free as information could be
intercepted, corrupted, lost, destroyed, arrive late or incomplete, or
contain viruses. The sender therefore does not accept liability for any
errors or omissions in the contents of this message, which arise as a
result of e-mail transmission. If verification is required please
request a hard-copy version.
